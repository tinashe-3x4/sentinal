import 'package:sentinal/features/cards/data/models/card_model.dart';

abstract class LocalCardDataSource {
  Future<void> addCard(CardModel cardModel);
  Future<List<CardModel>> getCards();
  Future<void> deleteCard(String id);
  Future<void> updateCard(CardModel cardModel);
}
