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

    ever(remaining, (int value) async {
      if (value == 1) {
        await setDeck();
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

  @override
  void dispose() {
    super.dispose();
    currentCardFlipController.dispose();
    newCardFlipController.dispose();
    confettiController.dispose();
    resultController.dispose();
    versusController.dispose();
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

    if (newCard.value!.value == currentCard.value.value) {
      newCard.value = await drawCard(deckId.value);
      await _delay(400);
    }

    newCardFlipController.forward(from: 0);
    await _delay(400);

    if ((isUp && newCard.value!.getNumericValue() > currentCard.value.getNumericValue()) ||
        (!isUp && newCard.value!.getNumericValue() < currentCard.value.getNumericValue())) {
      gameResult.value = GameResult.win;
      currentStreak.value++;
      if (currentStreak.value > bestStreak.value) {
        bestStreak.value++;
        storage.write('best_streak', bestStreak.value);
      }
      confettiController.forward(from: 0);
    } else {
      gameResult.value = GameResult.lose;
      currentStreak.value = 0;
    }

    resultController.forward(from: 0);
    await _delay(1500);

    currentCard.value = newCard.value!;
    gameResult.value = GameResult.none;
    currentCardFlipController.forward(from: 0);
    newCard.value = null;
    isRevealing.value = false;
  }

  Future<void> _delay(int millis) async =>
      await Future.delayed(Duration(milliseconds: millis));

  void resetGame() {
    currentCardFlipController.reset();
    newCardFlipController.reset();
    confettiController.reset();
    resultController.reset();
    currentStreak.value = 0;
    gameResult.value = GameResult.none;
    isRevealing.value = false;
    newCard.value = null;
  }

  void initAnimations() {
    currentCardFlipController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    newCardFlipController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    confettiController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    resultController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    versusController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    versusAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
        CurvedAnimation(parent: versusController, curve: Curves.easeInOut));

    currentCardFlipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: currentCardFlipController, curve: Curves.easeInOut),
    );

    newCardFlipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: newCardFlipController, curve: Curves.easeInOut),
    );

    confettiAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: confettiController, curve: Curves.easeOut),
    );

    resultAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: resultController, curve: Curves.elasticOut),
    );
  }
}