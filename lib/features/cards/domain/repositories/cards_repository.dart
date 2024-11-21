import 'package:fpdart/fpdart.dart';
import 'package:sentinal/app/errors/failure.dart';
import 'package:sentinal/features/cards/domain/entities/cards_entity.dart';

abstract class CardsRepository {
  Future<Either<Failure, List<CardEntity>>> getCards();
  Future<Either<Failure, CardEntity>> createCard(CardEntity card);
}
