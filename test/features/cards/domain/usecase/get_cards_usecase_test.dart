import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sentinal/app/errors/database_failure.dart';
import 'package:sentinal/app/errors/failure.dart';
import 'package:sentinal/features/cards/domain/entities/cards_entity.dart';
import 'package:sentinal/features/cards/domain/repositories/cards_repository.dart';
import 'package:sentinal/features/cards/domain/usecases/get_cards_usecase.dart';

import 'get_cards_usecase_test.mocks.dart';

@GenerateMocks([CardsRepository])
void main() {
  provideDummy<Either<Failure, List<CardEntity>>>(const Right<Failure, List<CardEntity>>([]));

  late GetCardsUsecase getCardsUsecase;
  late MockCardsRepository mockCardsRepository;

  setUp(() {
    mockCardsRepository = MockCardsRepository();
    getCardsUsecase = GetCardsUsecase(mockCardsRepository);
  });

  test('get stored list of cards from repository', () async {
    // Arrange
    final testCards = [
      const CardEntity(
        id: 1,
        cardNumber: '1234 5678 9012 3456',
        cardType: 'Visa',
        expirationDate: '12/23',
        cardHolderName: 'assets/cards/visa.png',
        cvv: '123',
        issuedCountry: 'RSA',
      ),
      const CardEntity(
        id: 2,
        cardNumber: '9876 5432 1098 7654',
        cardType: 'MasterCard',
        expirationDate: '11/24',
        cardHolderName: 'Joe Riga',
        cvv: '456',
        issuedCountry: 'USA',
      ),
    ];

    when(mockCardsRepository.getCards()).thenAnswer((_) async => Right(testCards));

    // Act
    final result = await getCardsUsecase.execute();

    // Assert
    expect(result, Right<Failure, List<CardEntity>>(testCards));
    verify(mockCardsRepository.getCards()).called(1);
    verifyNoMoreInteractions(mockCardsRepository);
  });

  test('returns Failure when repository fails', () async {
    // Arrange
    final testFailure = DatabaseInvalidDataFailure('');
    when(mockCardsRepository.getCards()).thenAnswer((_) async => Left(testFailure));

    // Act
    final result = await getCardsUsecase.execute();

    // Assert
    expect(result, Left<Failure, List<CardEntity>>(testFailure));
    verify(mockCardsRepository.getCards()).called(1);
    verifyNoMoreInteractions(mockCardsRepository);
  });
}
