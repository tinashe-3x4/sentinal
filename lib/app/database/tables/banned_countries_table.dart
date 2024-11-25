import 'package:drift/drift.dart';

class BannedCountries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get country => text()();
}
