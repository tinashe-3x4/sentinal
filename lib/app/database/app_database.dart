import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:sentinal/app/database/tables/banned_countries_table.dart';
import 'package:sentinal/app/database/tables/cards_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Cards,
    BannedCountries,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          driftDatabase(
            name: 'sentinal-app',
            web: DriftWebOptions(
              sqlite3Wasm: Uri.parse('sqlite3.wasm'),
              driftWorker: Uri.parse('drift_worker.js'),
              onResult: (_) {},
            ),
          ),
        );

  AppDatabase.forTesting(DatabaseConnection super.connection);

  @override
  int get schemaVersion => 1;
}
