part of 'cards_bloc.dart';

sealed class CardsState extends Equatable {
  const CardsState();

  @override
  List<Object?> get props => [];
}

final class CardsInitial extends CardsState {
  const CardsInitial();
}

final class CardsLoading extends CardsState {
  const CardsLoading();
}

final class CardsLoaded extends CardsState {
  const CardsLoaded({required this.cards});
  final List<CardEntity> cards;

  @override
  List<Object?> get props => [cards];
}

final class CardAdded extends CardsState {
  const CardAdded({required this.cardId});
  final int cardId;

  @override
  List<Object?> get props => [cardId];
}

final class CardDeleted extends CardsState {
  const CardDeleted();
}

final class CardsError extends CardsState {
  const CardsError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
