import 'package:drift/drift.dart';
import 'package:sentinal/app/database/app_database.dart';
import 'package:sentinal/features/cards/data/models/card_model.dart';

class LocalCardDataSource {
  LocalCardDataSource(this._db);
  final AppDatabase _db;

  Future<void> addCard(CardModel cardModel) async {
    final card = CardsCompanion(
      id: Value(cardModel.id),
      cardNumber: Value(cardModel.cardNumber),
      cardType: Value(cardModel.cardType),
      expirationDate: Value(cardModel.expirationDate),
      assetPath: Value(cardModel.assetPath),
    );

    await _db.into(_db.cards).insert(card);
  }

  Future<List<CardModel>> getAllCards() async {
    final cardRows = await _db.select(_db.cards).get();
    return cardRows
        .map(
          (row) => CardModel(
            id: row.id,
            cardNumber: row.cardNumber,
            cardType: row.cardType,
            expirationDate: row.expirationDate,
            assetPath: row.assetPath,
          ),
        )
        .toList();
  }

  Future<void> deleteCard(String id) async {
    await (_db.delete(_db.cards)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> updateCard(CardModel cardModel) async {
    final card = CardsCompanion(
      id: Value(cardModel.id),
      cardNumber: Value(cardModel.cardNumber),
      cardType: Value(cardModel.cardType),
      expirationDate: Value(cardModel.expirationDate),
      assetPath: Value(cardModel.assetPath),
    );

    await (_db.update(_db.cards)..where((tbl) => tbl.id.equals(cardModel.id))).write(card);
  }
}
