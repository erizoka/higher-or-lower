import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:higher_or_lower/api/deck_of_card_repository.dart';

import '../model/deck.dart';
import 'helper/cards_variables.dart';

class CardsController extends GetxController
  with DeckOfCardRepository, CardsVariables, GetTickerProviderStateMixin {

  @override
  Future<void> onInit() async {
    super.onInit();

    ever(remaining, (int value) {
      if (value == 0) {
        setDeck();
      }
    });
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await setDeck();
    currentCard.value = await drawCard(deckId.value);
    bestStreak.value = storage.read('best_streak') ?? 0;
    initAnimations();
  }

  Future<void> setDeck() async {
    Deck deck = await getNewDeck();
    deckId.value = deck.deckId!;
    remaining.value = deck.remaining!;
  }

  Future<void> handleGuess(bool isUp) async {
    if(isRevealing.value || currentCard.value.value == null) return;

    isRevealing.value = true;
    newCard.value = await drawCard(deckId.value);

    cardFlipController.forward(from: 0);
    await Future.delayed(const Duration(milliseconds: 800));

    if ((isUp && newCard.value!.getNumericValue() > currentCard.value.getNumericValue()) ||
        (!isUp && newCard.value!.getNumericValue() < currentCard.value.getNumericValue())) {
      gameResult.value = GameResult.win;
      currentStreak.value++;
      if (currentStreak.value > bestStreak.value) {
        bestStreak.value++;
        storage.write('best_streak', bestStreak.value);
      }
    } else {
      gameResult.value = GameResult.lose;
      currentStreak.value = 0;
    }

    resultController.forward(from: 0);
    if (gameResult.value == GameResult.win) confettiController.forward(from: 0);

    currentCard.value = newCard.value!;
    gameResult.value = GameResult.none;
    newCard.value = null;
    isRevealing.value = false;
  }

  void resetGame() {
    cardFlipController.reset();
    confettiController.reset();
    resultController.reset();
    currentStreak.value = 0;
    gameResult.value = GameResult.none;
    isRevealing.value = false;
    newCard.value = null;
  }

  void initAnimations() {
    cardFlipController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    confettiController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    resultController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    cardFlipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: cardFlipController, curve: Curves.easeInOut),
    );

    confettiAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: confettiController, curve: Curves.easeOut),
    );

    resultAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: resultController, curve: Curves.elasticOut),
    );
  }
}