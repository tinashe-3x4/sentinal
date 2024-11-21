import 'package:equatable/equatable.dart';

class CardEntity extends Equatable {
  const CardEntity({
    required this.id,
    required this.cardNumber,
    required this.cardType,
    required this.expirationDate,
    required this.assetPath,
  });

  final int id;
  final String cardNumber;
  final String cardType;
  final String expirationDate;
  final String assetPath;

  @override
  List<Object?> get props => [
        id,
        cardNumber,
        cardType,
        expirationDate,
        assetPath,
      ];
}
