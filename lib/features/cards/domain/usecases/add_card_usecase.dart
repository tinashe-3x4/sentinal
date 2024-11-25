import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sentinal/app/errors/failure.dart';
import 'package:sentinal/features/cards/domain/repositories/cards_repository.dart';

@lazySingleton
class AddCardUseCase {
  const AddCardUseCase(this.repository);
  final CardsRepository repository;

  Future<Either<Failure, int>> execute({
    required String cardNumber,
    required String cardType,
    required String expirationDate,
    required String cardHolderName,
  }) async {
    return repository.addCard(
      cardNumber: cardNumber,
      cardType: cardType,
      expirationDate: expirationDate,
      cardHolderName: cardHolderName,
    );
  }
}
