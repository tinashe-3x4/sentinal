import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sentinal/app/errors/database_failure.dart';
import 'package:sentinal/app/errors/failure.dart';
import 'package:sentinal/features/cards/data/data_sources/local/local_card_data_source.dart';
import 'package:sentinal/features/cards/domain/entities/cards_entity.dart';
import 'package:sentinal/features/cards/domain/repositories/cards_repository.dart';

class CardsRepositoryImpl extends CardsRepository {
  CardsRepositoryImpl({required this.localCardDataSource});

  LocalCardDataSource localCardDataSource;

  @override
  Future<Either<Failure, int>> addCard({
    required String cardNumber,
    required String cardType,
    required String expirationDate,
    required String assetPath,
  }) async {
    try {
     final cardId = await localCardDataSource.addCard(
        assetPath: assetPath,
        cardNumber: cardNumber,
        cardType: cardType,
        expirationDate: expirationDate,
      );

      return Right(cardId);
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
  Future<Either<Failure, List<CardEntity>>> getCards() async {
    try {
      final cards = await localCardDataSource.getCards();

      return Right(cards);
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
  Future<Either<Failure, Unit>> deleteCard(int id) async {
    try {
      await localCardDataSource.deleteCard(id);

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
