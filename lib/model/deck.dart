class Deck {
  String? deckId;
  int? remaining;

  Deck({this.deckId, this.remaining});

  factory Deck.fromJson(Map<String, dynamic> json) {
    return Deck(
      deckId: json['deck_id'],
      remaining: json['remaining'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deck_id': deckId,
      'remaining': remaining,
    };
  }
}
