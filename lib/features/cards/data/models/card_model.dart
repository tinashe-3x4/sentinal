import 'package:equatable/equatable.dart';
import 'package:sentinal/features/cards/domain/entities/cards_entity.dart';

class CardModel extends CardEntity with EquatableMixin {
  const CardModel({
    required super.id,
    required super.cardNumber,
    required super.cardType,
    required super.expirationDate,
    required super.assetPath,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'] as int,
      cardNumber: json['cardNumber'] as String,
      cardType: json['cardType'] as String,
      expirationDate: json['expirationDate'] as String,
      assetPath: json['assetPath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cardNumber': cardNumber,
      'cardType': cardType,
      'expirationDate': expirationDate,
      'assetPath': assetPath,
    };
  }

  @override
  List<Object?> get props => [id, cardNumber, cardType, expirationDate, assetPath];
}
