import 'package:sentinal/features/cards/data/models/card_model.dart';

abstract class LocalCardDataSource {
  Future<int> addCard({
    required String cardNumber,
    required String cardType,
    required String expirationDate,
    required String cardHolderName,
    required String cvv,
    required String issuedCountry,
  });
  Future<List<CardModel>> getCards();
  Future<void> deleteCard(int id);
}
