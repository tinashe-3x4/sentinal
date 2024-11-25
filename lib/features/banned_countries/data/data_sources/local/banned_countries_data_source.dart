abstract class BannedCountriesDataSource {
  Future<List<String>> getBannedCountries();
  Future<void> addBannedCountries(List<String> bannedCountries);
  Future<void> removeBannedCountry(String country);
}
