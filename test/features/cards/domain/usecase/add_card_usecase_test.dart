import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:sentinal/app/errors/database_failure.dart';
import 'package:sentinal/app/errors/failure.dart';
import 'package:sentinal/features/cards/domain/usecases/add_card_usecase.dart';

import '../../data/repositories/cards_repository_impl_test.mocks.dart';

void main() {
  provideDummy<Either<Failure, int>>(const Right<Failure, int>(1));

  late AddCardUseCase addCardUseCase;
  late MockCardsRepository mockRepository;

  setUp(() {
    mockRepository = MockCardsRepository();
    addCardUseCase = AddCardUseCase(mockRepository);
  });

  const tCardNumber = '1234567890123456';
  const tCardType = 'visa';
  const tExpirationDate = '12/25';
  const tCardHolderName = 'Joe Riga';
  const tCardId = 1;

  test(
    'should return card id when adding card is successful',
    () async {
      // arrange
      when(
        mockRepository.addCard(
          cardNumber: tCardNumber,
          cardType: tCardType,
          expirationDate: tExpirationDate,
          cardHolderName: tCardHolderName,
        ),
      ).thenAnswer((_) async => const Right(tCardId));

      // act
      final result = await addCardUseCase.execute(
        cardNumber: tCardNumber,
        cardType: tCardType,
        expirationDate: tExpirationDate,
        cardHolderName: tCardHolderName,
      );

      // assert
      expect(result, const Right<Failure, int>(tCardId));
      verify(
        mockRepository.addCard(
          cardNumber: tCardNumber,
          cardType: tCardType,
          expirationDate: tExpirationDate,
          cardHolderName: tCardHolderName,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockRepository);
    },
  );

  test(
    'should return failure when adding card fails',
    () async {
      // arrange
      final failure = DatabaseInvalidDataFailure('Invalid data');
      when(
        mockRepository.addCard(
          cardNumber: tCardNumber,
          cardType: tCardType,
          expirationDate: tExpirationDate,
          cardHolderName: tCardHolderName,
        ),
      ).thenAnswer((_) async => Left(failure));

      // act
      final result = await addCardUseCase.execute(
        cardNumber: tCardNumber,
        cardType: tCardType,
        expirationDate: tExpirationDate,
        cardHolderName: tCardHolderName,
      );

      // assert
      expect(result, Left<Failure, int>(failure));
      verify(
        mockRepository.addCard(
          cardNumber: tCardNumber,
          cardType: tCardType,
          expirationDate: tExpirationDate,
          cardHolderName: tCardHolderName,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
