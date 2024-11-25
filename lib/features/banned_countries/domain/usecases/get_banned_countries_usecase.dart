import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sentinal/app/errors/failure.dart';
import 'package:sentinal/features/banned_countries/domain/repositories/banned_countries_repository.dart';

@lazySingleton
class GetBannedCountriesUsecase {
  GetBannedCountriesUsecase(this.repository);
  final BannedCountriesRepository repository;

  Future<Either<Failure, List<String>>> execute() async {
    return repository.getBannedCountries();
  }
}
