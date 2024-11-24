import 'package:u_credit_card/u_credit_card.dart';

extension CreditCardTypeExtension on CreditCardType {
  static CreditCardType fromString(String type) {
    switch (type.toLowerCase()) {
      case 'visa':
        return CreditCardType.visa;
      case 'mastercard':
        return CreditCardType.mastercard;
      case 'amex':
        return CreditCardType.amex;
      default:
        return CreditCardType.visa;
    }
  }
}
