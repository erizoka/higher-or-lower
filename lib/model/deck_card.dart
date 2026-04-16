class DeckCard {
  String? code;
  String? image;
  String? value;
  String? suit;

  DeckCard({this.code, this.image, this.value, this.suit});

  factory DeckCard.fromJson(Map<String, dynamic> json) {
    return DeckCard(
      code: json['code'],
      image: json['image'],
      value: json['value'],
      suit: json['suit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'image': image,
      'value': value,
      'suit': suit,
    };
  }

  int getNumericValue() {
    switch (value?.toUpperCase()) {
      case 'ACE':
        return 1;
      case 'JACK':
        return 11;
      case 'QUEEN':
        return 12;
      case 'KING':
        return 13;
      default:
        return int.tryParse(value ?? '') ?? 0;
    }
  }
}
