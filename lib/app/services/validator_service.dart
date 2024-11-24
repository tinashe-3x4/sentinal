class ValidatorService {
  static String? validateRequiredField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter $fieldName';
    }
    return null;
  }

  static String? validateCardNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a card number';
    }
    return null;
  }

  static String? validateExpirationDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter the expiration date';
    }
    if (!RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$').hasMatch(value)) {
      return 'Please enter a valid expiration date (MM/YY)';
    }
    return null;
  }

  static String? validateCvv(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter the CVV';
    }
    if (value.length != 3 && value.length != 4) {
      return 'CVV must be 3 or 4 digits';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'CVV must be numeric';
    }
    return null;
  }
}
