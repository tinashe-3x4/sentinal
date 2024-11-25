import 'package:equatable/equatable.dart';

class CardEntity extends Equatable {
  const CardEntity({
    required this.id,
    required this.cardNumber,
    required this.cardType,
    required this.expirationDate,
    required this.cardHolderName,
    required this.cvv,
    required this.issuedCountry,
  });

  final int id;
  final String cardNumber;
  final String cardType;
  final String expirationDate;
  final String cardHolderName;
  final String cvv;
  final String issuedCountry;

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
