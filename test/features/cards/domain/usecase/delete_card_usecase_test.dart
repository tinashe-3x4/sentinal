import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:sentinal/app/errors/database_failure.dart';
import 'package:sentinal/app/errors/failure.dart';
import 'package:sentinal/features/cards/domain/usecases/delete_card_usecase.dart';

import '../../data/repositories/cards_repository_impl_test.mocks.dart';

void main() {
  provideDummy<Either<Failure, Unit>>(const Right<Failure, Unit>(unit));

  late DeleteCardUseCase deleteCardUseCase;
  late MockCardsRepository mockRepository;

  setUp(() {
    mockRepository = MockCardsRepository();
    deleteCardUseCase = DeleteCardUseCase(mockRepository);
  });

  const tCardId = 1;

  test(
    'should delete card when id is valid',
    () async {
      // arrange
      when(mockRepository.deleteCard(tCardId)).thenAnswer((_) async => const Right(unit));

      // act
      final result = await deleteCardUseCase.execute(tCardId);

      // assert
      expect(result, const Right<Failure, Unit>(unit));
      verify(mockRepository.deleteCard(tCardId)).called(1);
      verifyNoMoreInteractions(mockRepository);
    },
  );

  test(
    'should return failure when deleting card fails',
    () async {
      // arrange
      final failure = DatabaseInvalidDataFailure('Invalid data');
      when(mockRepository.deleteCard(tCardId)).thenAnswer((_) async => Left(failure));

      // act
      final result = await deleteCardUseCase.execute(tCardId);

      // assert
      expect(result, Left<Failure, Unit>(failure));
      verify(mockRepository.deleteCard(tCardId)).called(1);
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
