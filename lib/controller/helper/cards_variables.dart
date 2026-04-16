import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../model/deck_card.dart';

mixin CardsVariables {
  final storage = GetStorage();

  late AnimationController cardFlipController;
  late AnimationController confettiController;
  late AnimationController resultController;
  late AnimationController versusController;
  late Animation<double> versusAnimation;
  late Animation<double> cardFlipAnimation;
  late Animation<double> confettiAnimation;
  late Animation<double> resultAnimation;

  Rx<String> deckId = ''.obs;
  Rx<int> remaining = 0.obs;
  Rx<DeckCard> currentCard = DeckCard().obs;
  final Rx<DeckCard?> newCard = Rx<DeckCard?>(null);

  Rx<int> currentStreak = 0.obs;
  Rx<int> bestStreak = 0.obs;
  Rx<bool> isRevealing = false.obs;
  Rx<GameResult> gameResult = GameResult.none.obs;
}

enum GameResult {win, lose, none}