import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sentinal/app/errors/database_failure.dart';
import 'package:sentinal/app/errors/failure.dart';
import 'package:sentinal/features/banned_countries/data/data_sources/local/banned_countries_data_source.dart';
import 'package:sentinal/features/banned_countries/domain/repositories/banned_countries_repository.dart';

@LazySingleton(as: BannedCountriesRepository)
class BannedCountriesRepositoryImpl extends BannedCountriesRepository {
  BannedCountriesRepositoryImpl({
    required this.dataSource,
  });

  final BannedCountriesDataSource dataSource;

  @override
  Future<Either<Failure, Unit>> addBannedCountry(List<String> country) async {
    try {
      await dataSource.addBannedCountries(country);

      return const Right(unit);
    } on InvalidDataException {
      return Left(
        DatabaseInvalidDataFailure(
          'Invalid data was provided.',
        ),
      );
    } catch (e) {
      return Left(
        UnknownDatabaseFailure(
          'An unknown database error occurred.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<String>>> getBannedCountries() async {
    try {
      final countries = await dataSource.getBannedCountries();

      return Right(countries);
    } on InvalidDataException {
      return Left(
        DatabaseInvalidDataFailure(
          'Invalid data was provided.',
        ),
      );
    } catch (e) {
      return Left(
        UnknownDatabaseFailure(
          'An unknown database error occurred.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> removeBannedCountry(String country) async {
    try {
      await dataSource.removeBannedCountry(country);

      return const Right(unit);
    } on InvalidDataException {
      return Left(
        DatabaseInvalidDataFailure(
          'Invalid data was provided.',
        ),
      );
    } catch (e) {
      return Left(
        UnknownDatabaseFailure(
          'An unknown database error occurred.',
        ),
      );
    }
  }
}
