import 'package:fpdart/fpdart.dart';
import 'package:sentinal/app/errors/failure.dart';


abstract class BannedCountriesRepository {
  Future<Either<Failure, List<String>>> getBannedCountries();
  Future<Either<Failure, Unit>> addBannedCountry(List<String> country);
  Future<Either<Failure, Unit>> removeBannedCountry(String country);
}
