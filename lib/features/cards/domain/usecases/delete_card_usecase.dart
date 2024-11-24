import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sentinal/app/errors/failure.dart';
import 'package:sentinal/features/cards/domain/repositories/cards_repository.dart';

@lazySingleton
class DeleteCardUseCase {
  DeleteCardUseCase(this.repository);
  final CardsRepository repository;

  Future<Either<Failure, Unit>> execute(int id) async {
    return repository.deleteCard(id);
  }
}
