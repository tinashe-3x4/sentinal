import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:sentinal/app/database/app_database.dart';
import 'package:sentinal/features/banned_countries/data/data_sources/local/banned_countries_data_source.dart';

@LazySingleton(as: BannedCountriesDataSource)
class BannedCountriesDataSourceImpl extends BannedCountriesDataSource {
  BannedCountriesDataSourceImpl(this._db);
  final AppDatabase _db;

  @override
  Future<List<String>> getBannedCountries() async {
    final bannedCountriesRows = await _db.select(_db.bannedCountries).get();
    return bannedCountriesRows.map((row) => row.country).toList();
  }

  @override
  Future<void> addBannedCountries(List<String> bannedCountries) async {
    for (final country in bannedCountries) {
      final entity = BannedCountriesCompanion(
        country: Value(country),
      );

      await _db.into(_db.bannedCountries).insert(entity);
    }
  }

  @override
  Future<void> removeBannedCountry(String country) async {
    await (_db.delete(_db.bannedCountries)
          ..where(
            (tbl) => tbl.country.equals(country),
          ))
        .go();
  }
}
