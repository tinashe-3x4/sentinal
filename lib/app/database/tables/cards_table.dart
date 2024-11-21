import 'package:drift/drift.dart';

class Cards extends Table {
  TextColumn get id => text()();
  TextColumn get cardNumber => text()();
  TextColumn get cardType => text()();
  TextColumn get expirationDate => text()();
  TextColumn get assetPath => text()();

  @override
  Set<Column> get primaryKey => {id};
}
