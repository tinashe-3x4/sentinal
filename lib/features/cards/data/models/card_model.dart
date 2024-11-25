import 'package:equatable/equatable.dart';
import 'package:sentinal/features/cards/domain/entities/cards_entity.dart';

class CardModel extends CardEntity with EquatableMixin {
  const CardModel({
    required super.id,
    required super.cardNumber,
    required super.cardType,
    required super.expirationDate,
    required super.cardHolderName,
    required super.cvv,
    required super.issuedCountry,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'] as int,
      cardNumber: json['cardNumber'] as String,
      cardType: json['cardType'] as String,
      expirationDate: json['expirationDate'] as String,
      cardHolderName: json['cardHolderName'] as String,
      cvv: json['cvv'] as String,
      issuedCountry: json['issuedCountry'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cardNumber': cardNumber,
      'cardType': cardType,
      'expirationDate': expirationDate,
      'cardHolderName': cardHolderName,
      'cvv': cvv,
      'issuedCountry': issuedCountry,
    };
  }

  @override
  List<Object?> get props => [
        id,
        cardNumber,
        cardType,
        expirationDate,
        cardHolderName,
        cvv,
        issuedCountry,
      ];
}
