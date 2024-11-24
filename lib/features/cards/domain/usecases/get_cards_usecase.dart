import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sentinal/app/errors/failure.dart';
import 'package:sentinal/features/cards/domain/entities/cards_entity.dart';
import 'package:sentinal/features/cards/domain/repositories/cards_repository.dart';

@lazySingleton
class GetCardsUsecase {
  const GetCardsUsecase(this._cardsRepository);
  final CardsRepository _cardsRepository;

  Future<Either<Failure, List<CardEntity>>> execute() async {
    return _cardsRepository.getCards();
  }
}
