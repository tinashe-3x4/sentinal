part of 'cards_bloc.dart';

sealed class CardsEvent extends Equatable {
  const CardsEvent();

  @override
  List<Object?> get props => [];
}

final class LoadCards extends CardsEvent {
  const LoadCards();
}

final class AddCard extends CardsEvent {
  const AddCard({
    required this.cardNumber,
    required this.cardType,
    required this.expirationDate,
    required this.cardHolderName,
  });
  final String cardNumber;
  final String cardType;
  final String expirationDate;
  final String cardHolderName;

  @override
  List<Object?> get props => [cardNumber, cardType, expirationDate, cardHolderName];
}

final class DeleteCard extends CardsEvent {
  const DeleteCard({required this.cardId});
  final int cardId;

  @override
  List<Object?> get props => [cardId];
}
