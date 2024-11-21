import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:sentinal/app/database/app_database.dart';
import 'package:sentinal/app/database/tables/cards_table.dart';
import 'package:sentinal/features/cards/data/data_sources/local/local_card_data_source.dart';
import 'package:sentinal/features/cards/data/models/card_model.dart';

@GenerateMocks([Cards])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late LocalCardDataSource dataSource;
  late AppDatabase db;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());

    dataSource = LocalCardDataSource(db);
  });

  tearDown(() async {
    await db.close();
  });

  test('addCard should insert a card into the database', () async {
    const cardModel = CardModel(
      id: '1',
      cardNumber: '1234 5678 9012 3456',
      cardType: 'Visa',
      expirationDate: '12/25',
      assetPath: 'assets/cards/visa.png',
    );

    await dataSource.addCard(cardModel);

    final cards = await dataSource.getAllCards();

    expect(cards, isNotEmpty);
    expect(cards.first.id, equals('1'));
    expect(cards.first.cardNumber, equals('1234 5678 9012 3456'));
  });

  test('getAllCards should return all cards from the database', () async {
    const card1 = CardModel(
      id: '1',
      cardNumber: '1234 5678 9012 3456',
      cardType: 'Visa',
      expirationDate: '12/25',
      assetPath: 'assets/cards/visa.png',
    );
    const card2 = CardModel(
      id: '2',
      cardNumber: '9876 5432 1098 7654',
      cardType: 'MasterCard',
      expirationDate: '11/24',
      assetPath: 'assets/cards/mastercard.png',
    );

    await dataSource.addCard(card1);
    await dataSource.addCard(card2);

    final cards = await dataSource.getAllCards();

    expect(cards.length, equals(2));
    expect(cards.map((card) => card.id), containsAll(['1', '2']));
  });

  test('deleteCard should remove a card from the database', () async {
    const cardModel = CardModel(
      id: '1',
      cardNumber: '1234 5678 9012 3456',
      cardType: 'Visa',
      expirationDate: '12/25',
      assetPath: 'assets/cards/visa.png',
    );

    await dataSource.addCard(cardModel);

    await dataSource.deleteCard('1');

    final cards = await dataSource.getAllCards();

    expect(cards, isEmpty);
  });

  test('updateCard should update a card in the database', () async {
    const cardModel = CardModel(
      id: '1',
      cardNumber: '1234 5678 9012 3456',
      cardType: 'Visa',
      expirationDate: '12/25',
      assetPath: 'assets/cards/visa.png',
    );

    await dataSource.addCard(cardModel);

    const updatedCardModel = CardModel(
      id: '1',
      cardNumber: '1111 2222 3333 4444',
      cardType: 'Visa',
      expirationDate: '01/26',
      assetPath: 'assets/cards/visa_new.png',
    );

    await dataSource.updateCard(updatedCardModel);

    final cards = await dataSource.getAllCards();

    expect(cards.first.cardNumber, equals('1111 2222 3333 4444'));
    expect(cards.first.expirationDate, equals('01/26'));
    expect(cards.first.assetPath, equals('assets/cards/visa_new.png'));
  });
}
