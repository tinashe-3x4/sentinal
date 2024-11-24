import 'package:drift/drift.dart';

class Cards extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get cardNumber => text()();
  TextColumn get cardType => text()();
  TextColumn get expirationDate => text()();
  TextColumn get cardHolderName => text()();
  TextColumn get cvv => text()();
  TextColumn get issuedCountry => text()();
}
