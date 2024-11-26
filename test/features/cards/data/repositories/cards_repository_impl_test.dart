import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sentinal/app/errors/failure.dart';
import 'package:sentinal/features/cards/data/data_sources/local/local_card_data_source.dart';
import 'package:sentinal/features/cards/data/models/card_model.dart';
import 'package:sentinal/features/cards/data/repositories/cards_repository_impl.dart';
import 'package:sentinal/features/cards/domain/entities/cards_entity.dart';
import 'package:sentinal/features/cards/domain/repositories/cards_repository.dart';
import 'package:sentinal/features/cards/domain/usecases/add_card_usecase.dart';
import 'package:sentinal/features/cards/domain/usecases/delete_card_usecase.dart';
import 'package:sentinal/features/cards/domain/usecases/get_cards_usecase.dart';

import 'cards_repository_impl_test.mocks.dart';

@GenerateMocks([
  LocalCardDataSource,
  CardsRepository,
  GetCardsUsecase,
  AddCardUseCase,
  DeleteCardUseCase,
])
void main() {
  late MockLocalCardDataSource mockLocalCardDataSource;
  late CardsRepositoryImpl mockCardsRepository;

  setUp(() {
    mockLocalCardDataSource = MockLocalCardDataSource();
    mockCardsRepository = CardsRepositoryImpl(localCardDataSource: mockLocalCardDataSource);
  });

  test('adds card via repository', () async {
    // Arrange
    const testCard = CardEntity(
      id: 1,
      cardNumber: '1234 5678 9012 3456',
      cardType: 'Visa',
      expirationDate: '12/23',
      cardHolderName: 'Joe Riga',
      cvv: '123',
      issuedCountry: 'RSA',
    );

    when(
      mockLocalCardDataSource.addCard(
        cardHolderName: testCard.cardHolderName,
        cardNumber: testCard.cardNumber,
        cardType: testCard.cardType,
        expirationDate: testCard.expirationDate,
        cvv: testCard.cvv,
        issuedCountry: testCard.issuedCountry,
      ),
    ).thenAnswer((_) async => 1);

    // Act
    final result = await mockCardsRepository.addCard(
      cardNumber: testCard.cardNumber,
      cardType: testCard.cardType,
      expirationDate: testCard.expirationDate,
      cardHolderName: testCard.cardHolderName,
    );

    // Assert
    expect(result, const Right<Failure, int>(1));
    verify(
      mockLocalCardDataSource.addCard(
        cardHolderName: testCard.cardHolderName,
        cardNumber: testCard.cardNumber,
        cardType: testCard.cardType,
        expirationDate: testCard.expirationDate,
        cvv: testCard.cvv,
        issuedCountry: testCard.issuedCountry,
      ),
    ).called(1);
    verifyNoMoreInteractions(mockLocalCardDataSource);
  });

  test('deleteCard should remove a card from the database', () async {
    // Arrange
    const cardId = 1;

    when(mockLocalCardDataSource.deleteCard(cardId)).thenAnswer((_) async => Unit);

    // Act
    await mockCardsRepository.deleteCard(cardId);

    // Assert
    verify(mockLocalCardDataSource.deleteCard(cardId)).called(1);
    verifyNoMoreInteractions(mockLocalCardDataSource);
  });

  test('getCards should return a list of cards from the database', () async {
    // Arrange
    final testCards = [
      const CardModel(
        id: 1,
        cardNumber: '1234 5678 9012 3456',
        cardType: 'Visa',
        expirationDate: '12/23',
        cardHolderName: 'Joe Riga',
        cvv: '123',
        issuedCountry: 'RSA',
      ),
      const CardModel(
        id: 2,
        cardNumber: '9876 5432 1098 7654',
        cardType: 'Mastercard',
        expirationDate: '03/25',
        cardHolderName: 'Joe Riga',
        cvv: '123',
        issuedCountry: 'RSA',
      ),
    ];

    when(mockLocalCardDataSource.getCards()).thenAnswer((_) async => testCards);

    // Act
    final result = await mockCardsRepository.getCards();

    // Assert
    expect(result, Right<Failure, List<CardEntity>>(testCards));
    verify(mockLocalCardDataSource.getCards()).called(1);
    verifyNoMoreInteractions(mockLocalCardDataSource);
  });
}
