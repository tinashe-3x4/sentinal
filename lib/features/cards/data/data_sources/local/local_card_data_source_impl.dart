import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:sentinal/app/database/app_database.dart';
import 'package:sentinal/features/cards/data/data_sources/local/local_card_data_source.dart';
import 'package:sentinal/features/cards/data/models/card_model.dart';

@LazySingleton(as: LocalCardDataSource)
class LocalCardDataSourceImpl extends LocalCardDataSource {
  LocalCardDataSourceImpl(this._db);
  final AppDatabase _db;

  @override
  Future<int> addCard({
    required String cardNumber,
    required String cardType,
    required String expirationDate,
    required String cardHolderName,
    required String cvv,
    required String issuedCountry,
  }) async {
    final card = CardsCompanion(
      cardNumber: Value(cardNumber),
      cardType: Value(cardType),
      expirationDate: Value(expirationDate),
      cardHolderName: Value(cardHolderName),
      cvv: Value(cvv),
      issuedCountry: Value(issuedCountry),
    );

    return _db.into(_db.cards).insert(card);
  }

  @override
  Future<List<CardModel>> getCards() async {
    final cardRows = await _db.select(_db.cards).get();
    return cardRows
        .map(
          (row) => CardModel(
            id: row.id,
            cardNumber: row.cardNumber,
            cardType: row.cardType,
            expirationDate: row.expirationDate,
            cardHolderName: row.cardHolderName,
            cvv: row.cvv,
            issuedCountry: row.issuedCountry,
          ),
        )
        .toList();
  }

  @override
  Future<void> deleteCard(int id) async {
    await (_db.delete(_db.cards)..where((tbl) => tbl.id.equals(id))).go();
  }
}
