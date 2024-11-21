import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sentinal/features/cards/domain/entities/cards_entity.dart';
import 'package:sentinal/features/cards/domain/usecases/add_card_usecase.dart';
import 'package:sentinal/features/cards/domain/usecases/delete_card_usecase.dart';
import 'package:sentinal/features/cards/domain/usecases/get_cards_usecase.dart';

part 'cards_event.dart';
part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc({
    required this.getCardsUsecase,
    required this.addCardUseCase,
    required this.deleteCardUseCase,
  }) : super(const CardsInitial()) {
    on<LoadCards>(_handleLoadCards);
    on<AddCard>(_handleAddCard);
    on<DeleteCard>(_handleDeleteCard);
  }

  final GetCardsUsecase getCardsUsecase;
  final AddCardUseCase addCardUseCase;
  final DeleteCardUseCase deleteCardUseCase;

  Future<void> _handleLoadCards(
    LoadCards event,
    Emitter<CardsState> emit,
  ) async {
    emit(const CardsLoading());

    final result = await getCardsUsecase.execute();

    result.fold(
      (failure) => emit(CardsError(message: failure.message)),
      (cards) => emit(CardsLoaded(cards: cards)),
    );
  }

  Future<void> _handleAddCard(
    AddCard event,
    Emitter<CardsState> emit,
  ) async {
    emit(const CardsLoading());

    final result = await addCardUseCase.execute(
      cardNumber: event.cardNumber,
      cardType: event.cardType,
      expirationDate: event.expirationDate,
      assetPath: event.assetPath,
    );

    result.fold(
      (failure) => emit(CardsError(message: failure.message)),
      (cardId) => emit(CardAdded(cardId: cardId)),
    );

    add(const LoadCards());
  }

  Future<void> _handleDeleteCard(
    DeleteCard event,
    Emitter<CardsState> emit,
  ) async {
    emit(const CardsLoading());

    final result = await deleteCardUseCase.execute(event.cardId);

    result.fold(
      (failure) => emit(CardsError(message: failure.message)),
      (_) => emit(const CardDeleted()),
    );

    add(const LoadCards());
  }
}
