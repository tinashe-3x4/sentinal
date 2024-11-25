import 'package:flutter_test/flutter_test.dart';
import 'package:sentinal/features/cards/data/models/card_model.dart';
import 'package:sentinal/features/cards/domain/entities/cards_entity.dart';

void main() {
  const testCardModel = CardModel(
    id: 1,
    cardNumber: '1234 5678 9012 3456',
    cardType: 'Visa',
    expirationDate: '12/23',
    cardHolderName: 'Joe Riga',
  );

  test('should be a subclass of Card Entity', () async {
    // assert
    expect(testCardModel, isA<CardEntity>());
  });

  test('returns valid model from JSON', () async {
    // arrange

    // act

    // expect
  });
}
