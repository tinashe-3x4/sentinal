import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sentinal/app/errors/failure.dart';
import 'package:sentinal/features/banned_countries/domain/repositories/banned_countries_repository.dart';

@lazySingleton
class AddBannedCountryUseCase {
  AddBannedCountryUseCase(this.repository);
  final BannedCountriesRepository repository;

  Future<Either<Failure, Unit>> execute(List<String> country) async {
    return repository.addBannedCountry(country);
  }
}
