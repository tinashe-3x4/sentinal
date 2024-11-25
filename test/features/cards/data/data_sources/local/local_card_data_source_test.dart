import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:sentinal/app/database/app_database.dart';
import 'package:sentinal/app/database/tables/cards_table.dart';
import 'package:sentinal/features/cards/data/data_sources/local/local_card_data_source.dart';
import 'package:sentinal/features/cards/data/data_sources/local/local_card_data_source_impl.dart';
import 'package:sentinal/features/cards/data/models/card_model.dart';

@GenerateMocks([Cards])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late LocalCardDataSource dataSource;
  late AppDatabase db;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());

    dataSource = LocalCardDataSourceImpl(db);
  });

  tearDown(() async {
    await db.close();
  });

  test('addCard should insert a card into the database', () async {
    const cardModel =  CardModel(
      id: 1,
      cardNumber: '1234 5678 9012 3456',
      cardType: 'Visa',
      expirationDate: '12/25',
      cardHolderName: 'Joe Riga',
      cvv: '123',
      issuedCountry: 'RSA',
    );

    await dataSource.addCard(
      cardNumber: cardModel.cardNumber,
      cardType: cardModel.cardType,
      expirationDate: cardModel.expirationDate,
      cardHolderName: cardModel.cardHolderName,
      cvv: cardModel.cvv,
      issuedCountry: cardModel.issuedCountry,
    );

    final cards = await dataSource.getCards();

    expect(cards, isNotEmpty);
    expect(cards.first.cardNumber, equals(cardModel.cardNumber));
  });

  test('getAllCards should return all cards from the database', () async {
    const card1 = CardModel(
      id: 1,
      cardNumber: '1234 5678 9012 3456',
      cardType: 'Visa',
      expirationDate: '12/25',
      cardHolderName: 'Joe Riga',
      cvv: '123',
      issuedCountry: 'RSA',
    );
    const card2 = CardModel(
      id: 2,
      cardNumber: '9876 5432 1098 7654',
      cardType: 'MasterCard',
      expirationDate: '11/24',
      cardHolderName: 'Joe Riga',
      cvv: '123',
      issuedCountry: 'RSA',
    );

    await dataSource.addCard(
      cardNumber: card1.cardNumber,
      cardType: card1.cardType,
      expirationDate: card1.expirationDate,
      cardHolderName: card1.cardHolderName,
      cvv: card1.cvv,
      issuedCountry: card1.issuedCountry,
    );

    await dataSource.addCard(
      cardNumber: card2.cardNumber,
      cardType: card2.cardType,
      expirationDate: card2.expirationDate,
      cardHolderName: card2.cardHolderName,
      cvv: card2.cvv,
      issuedCountry: card2.issuedCountry,
    );

    final insertedCards = await dataSource.getCards();

    expect(insertedCards.length, equals(2));
    expect(insertedCards.last.cardNumber, card2.cardNumber);
  });

  test('deleteCard should remove a card from the database', () async {
    const cardModel = CardModel(
      id: 1,
      cardNumber: '1234 5678 9012 3456',
      cardType: 'Visa',
      expirationDate: '12/25',
      cardHolderName: 'Joe Riga',
      cvv: '123',
      issuedCountry: 'RSA',
    );

    final id = await dataSource.addCard(
      cardNumber: cardModel.cardNumber,
      cardType: cardModel.cardType,
      expirationDate: cardModel.expirationDate,
      cardHolderName: cardModel.cardHolderName,
      cvv: cardModel.cvv,
      issuedCountry: cardModel.issuedCountry,
    );

    await dataSource.deleteCard(id);

    final cards = await dataSource.getCards();

    expect(cards, isEmpty);
  });
}
