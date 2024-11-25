// cards_bloc_test.dart
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:sentinal/app/errors/database_failure.dart';
import 'package:sentinal/app/errors/failure.dart';
import 'package:sentinal/features/cards/domain/entities/cards_entity.dart';
import 'package:sentinal/features/cards/presentation/bloc/bloc/cards_bloc.dart';

import '../../data/repositories/cards_repository_impl_test.mocks.dart';

void main() {
  late CardsBloc cardsBloc;
  late MockGetCardsUsecase mockGetCardsUsecase;
  late MockAddCardUseCase mockAddCardUseCase;
  late MockDeleteCardUseCase mockDeleteCardUseCase;

  provideDummy<Either<Failure, List<CardEntity>>>(
    const Right([]),
  );

  provideDummy<Either<Failure, int>>(
    const Right(0),
  );

  provideDummy<Either<Failure, Unit>>(
    const Right(unit),
  );

  const testCard = CardEntity(
    id: 1,
    cardNumber: '1234 5678 9012 3456',
    cardType: 'Visa',
    expirationDate: '12/24',
    cardHolderName: 'Joe Riga',
    cvv: '123',
    issuedCountry: 'RSA',
  );

  setUp(() {
    mockGetCardsUsecase = MockGetCardsUsecase();
    mockAddCardUseCase = MockAddCardUseCase();
    mockDeleteCardUseCase = MockDeleteCardUseCase();

    cardsBloc = CardsBloc(
      getCardsUsecase: mockGetCardsUsecase,
      addCardUseCase: mockAddCardUseCase,
      deleteCardUseCase: mockDeleteCardUseCase,
    );
  });

  tearDown(() {
    cardsBloc.close();
  });

  group('CardsBloc', () {
    test('initial state should be CardsInitial', () {
      expect(cardsBloc.state, const CardsInitial());
    });

    group('LoadCards', () {
      blocTest<CardsBloc, CardsState>(
        'emits [CardsLoading, CardsLoaded] when loading cards succeeds',
        build: () {
          when(mockGetCardsUsecase.execute()).thenAnswer((_) async => const Right([testCard]));
          return cardsBloc;
        },
        act: (bloc) => bloc.add(const LoadCards()),
        expect: () => [
          const CardsLoading(),
          const CardsLoaded(cards: [testCard]),
        ],
        verify: (_) {
          verify(mockGetCardsUsecase.execute()).called(1);
        },
      );

      blocTest<CardsBloc, CardsState>(
        'emits [CardsLoading, CardsError] when loading cards fails',
        build: () {
          when(mockGetCardsUsecase.execute()).thenAnswer(
            (_) async => Left(DatabaseInvalidDataFailure('Database error')),
          );
          return cardsBloc;
        },
        act: (bloc) => bloc.add(const LoadCards()),
        expect: () => [
          const CardsLoading(),
          const CardsError(message: 'Database error'),
        ],
        verify: (_) {
          verify(mockGetCardsUsecase.execute()).called(1);
        },
      );
    });

    group('AddCard', () {
      const cardNumber = '1234 5678 9012 3456';
      const cardType = 'Visa';
      const expirationDate = '12/24';
      const cardHolderName = 'Joe Riga';

      blocTest<CardsBloc, CardsState>(
        'emits [CardsLoading, CardAdded, CardsLoading, CardsLoaded] when adding card succeeds',
        build: () {
          when(
            mockAddCardUseCase.execute(
              cardNumber: anyNamed('cardNumber'),
              cardType: anyNamed('cardType'),
              expirationDate: anyNamed('expirationDate'),
              cardHolderName: anyNamed('cardHolderName'),
            ),
          ).thenAnswer((_) async => const Right(1));

          when(mockGetCardsUsecase.execute()).thenAnswer((_) async => const Right([testCard]));

          return cardsBloc;
        },
        act: (bloc) => bloc.add(
          const AddCard(
            cardNumber: cardNumber,
            cardType: cardType,
            expirationDate: expirationDate,
            cardHolderName: cardHolderName,
          ),
        ),
        expect: () => [
          const CardsLoading(),
          const CardAdded(cardId: 1),
          const CardsLoading(),
          const CardsLoaded(cards: [testCard]),
        ],
        verify: (_) {
          verify(
            mockAddCardUseCase.execute(
              cardNumber: cardNumber,
              cardType: cardType,
              expirationDate: expirationDate,
              cardHolderName: cardHolderName,
            ),
          ).called(1);
          verify(mockGetCardsUsecase.execute()).called(1);
        },
      );

      blocTest<CardsBloc, CardsState>(
        'emits [CardsLoading, CardsError] when adding card fails',
        build: () {
          when(
            mockAddCardUseCase.execute(
              cardNumber: anyNamed('cardNumber'),
              cardType: anyNamed('cardType'),
              expirationDate: anyNamed('expirationDate'),
              cardHolderName: anyNamed('cardHolderName'),
            ),
          ).thenAnswer(
            (_) async => Left(DatabaseInvalidDataFailure('Invalid card data')),
          );

          when(mockGetCardsUsecase.execute()).thenAnswer((_) async => const Right([]));

          return cardsBloc;
        },
        act: (bloc) => bloc.add(
          const AddCard(
            cardNumber: cardNumber,
            cardType: cardType,
            expirationDate: expirationDate,
            cardHolderName: cardHolderName,
          ),
        ),
        expect: () => [
          const CardsLoading(),
          const CardsError(message: 'Invalid card data'),
          const CardsLoading(),
          const CardsLoaded(cards: []),
        ],
        verify: (_) {
          verify(
            mockAddCardUseCase.execute(
              cardNumber: cardNumber,
              cardType: cardType,
              expirationDate: expirationDate,
              cardHolderName: cardHolderName,
            ),
          ).called(1);
          verify(mockGetCardsUsecase.execute()).called(1);
        },
      );
    });

    group('DeleteCard', () {
      blocTest<CardsBloc, CardsState>(
        'emits [CardsLoading, CardDeleted, CardsLoading, CardsLoaded] when deleting card succeeds',
        build: () {
          when(mockDeleteCardUseCase.execute(any)).thenAnswer((_) async => const Right(unit));

          when(mockGetCardsUsecase.execute()).thenAnswer((_) async => const Right([]));

          return cardsBloc;
        },
        act: (bloc) => bloc.add(const DeleteCard(cardId: 1)),
        expect: () => [
          const CardsLoading(),
          const CardDeleted(),
          const CardsLoading(),
          const CardsLoaded(cards: []),
        ],
        verify: (_) {
          verify(mockDeleteCardUseCase.execute(1)).called(1);
          verify(mockGetCardsUsecase.execute()).called(1);
        },
      );

      blocTest<CardsBloc, CardsState>(
        'emits [CardsLoading, CardsError] when deleting card fails',
        build: () {
          when(mockGetCardsUsecase.execute()).thenAnswer((_) async => const Right([]));

          when(mockDeleteCardUseCase.execute(any)).thenAnswer(
            (_) async => Left(DatabaseInvalidDataFailure('Delete failed')),
          );
          return cardsBloc;
        },
        act: (bloc) => bloc.add(const DeleteCard(cardId: 1)),
        expect: () => [
          const CardsLoading(),
          const CardsError(message: 'Delete failed'),
          const CardsLoading(),
          const CardsLoaded(cards: []),
        ],
      );
    });
  });
}
