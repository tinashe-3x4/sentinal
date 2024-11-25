import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sentinal/app/errors/failure.dart';
import 'package:sentinal/features/banned_countries/domain/repositories/banned_countries_repository.dart';

@lazySingleton
class DeleteBannedCountryUseCase {
  DeleteBannedCountryUseCase(this.repository);
  final BannedCountriesRepository repository;

  Future<Either<Failure, Unit>> execute(String country) async {
   return repository.removeBannedCountry(country);
  }
}
