import 'package:fpdart/fpdart.dart';
import 'package:sentinal/app/errors/failure.dart';
import 'package:sentinal/features/cards/domain/entities/cards_entity.dart';

abstract class CardsRepository {
  Future<Either<Failure, List<CardEntity>>> getCards();
  Future<Either<Failure, int>> addCard({
    required String cardNumber,
    required String cardType,
    required String expirationDate,
    required String assetPath,
  });
  Future<Either<Failure, Unit>> deleteCard(int id);
}
