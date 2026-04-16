import 'package:dio/dio.dart';
import 'package:higher_or_lower/model/deck.dart';

import '../model/deck_card.dart';

mixin class DeckOfCardRepository {
    String baseUrl = 'https://deckofcardsapi.com/api/deck';
    Dio dio = Dio();

    Future<Deck> getNewDeck() async {
       return await dio.get('$baseUrl/new/shuffle/?deck_count=1')
            .then((res) => Deck.fromJson(res.data));
    }

    Future<DeckCard> drawCard(String deckId) async {
      return await dio.get('$baseUrl/$deckId/draw/?count=1')
          .then((res) => DeckCard.fromJson(res.data['cards'][0]));
    }
}