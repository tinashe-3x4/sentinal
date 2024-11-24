import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentinal/app/constants/spacing.dart';
import 'package:sentinal/app/services/validator_service.dart';
import 'package:sentinal/features/cards/presentation/bloc/bloc/cards_bloc.dart';
import 'package:u_credit_card/u_credit_card.dart';

class AddCardDialog extends StatefulWidget {
  const AddCardDialog({
    super.key,
  });

  @override
  _AddCardDialogState createState() => _AddCardDialogState();
}

class _AddCardDialogState extends State<AddCardDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expirationDateController = TextEditingController();
  final TextEditingController _cardholderNameController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  String _cardType = 'Visa';
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    _cardNumberController.addListener(_validateForm);
    _expirationDateController.addListener(_validateForm);
    _cardholderNameController.addListener(_validateForm);
    _cvvController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expirationDateController.dispose();
    _cardholderNameController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isFormValid = _cardholderNameController.text.isNotEmpty &&
          _cardNumberController.text.isNotEmpty &&
          _expirationDateController.text.isNotEmpty &&
          _cvvController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Card'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CreditCardUi(
                cardHolderFullName: _cardholderNameController.text,
                cardNumber: _cardNumberController.text,
                validThru: _expirationDateController.text,
                creditCardType: _getCreditCardType(_cardType),
              ),
              Spacing.extraLarge.vertical,
              TextFormField(
                controller: _cardholderNameController,
                decoration: const InputDecoration(
                  labelText: 'Card Holder Name',
                  hintText: 'Enter cardholder name as shown on card',
                ),
                textCapitalization: TextCapitalization.words,
                validator: (value) => ValidatorService.validateRequiredField(
                  value,
                  _cardNumberController.text,
                ),
                onChanged: (value) {
                  setState(() {});
                  _validateForm();
                },
              ),
              Spacing.large.vertical,
              TextFormField(
                controller: _cardNumberController,
                decoration: const InputDecoration(
                  labelText: 'Card Number',
                  hintText: 'Enter your 16-digit card number',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(16),
                ],
                onChanged: (value) {
                  setState(() {
                    _cardType = _determineCardType(value);
                  });
                  _validateForm();
                },
                validator: ValidatorService.validateCardNumber,
              ),
              Spacing.large.vertical,
              TextFormField(
                controller: _cvvController,
                decoration: const InputDecoration(
                  labelText: 'CVV',
                  hintText: 'Enter your CVV',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                validator: ValidatorService.validateCvv,
              ),
              Spacing.large.vertical,
              TextFormField(
                decoration: const InputDecoration(labelText: 'Card Type'),
                readOnly: true,
                controller: TextEditingController(text: _cardType),
                enabled: false,
              ),
              Spacing.large.vertical,
              InkWell(
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 3650)),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _expirationDateController.text =
                          '${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year.toString().substring(2)}';
                      _validateForm();
                    });
                  }
                },
                child: IgnorePointer(
                  child: TextFormField(
                    controller: _expirationDateController,
                    decoration: const InputDecoration(
                      labelText: 'Expiration Date',
                      hintText: 'MM/YY',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    validator: ValidatorService.validateExpirationDate,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _isFormValid
              ? () {
                  if (_formKey.currentState!.validate()) {
                    context.read<CardsBloc>().add(
                          AddCard(
                            cardNumber: _cardNumberController.text,
                            cardType: _cardType,
                            expirationDate: _expirationDateController.text,
                            cardHolderName: _cardholderNameController.text,
                          ),
                        );
                    Navigator.of(context).pop();
                  }
                }
              : null,
          child: const Text('Save'),
        ),
      ],
    );
  }

  CreditCardType _getCreditCardType(String type) {
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

  String _determineCardType(String cardNumber) {
    if (cardNumber.isEmpty) return 'Visa';
    // ignore: parameter_assignments
    cardNumber = cardNumber.replaceAll(RegExp(r'\D'), '');
    final firstDigit = cardNumber.isNotEmpty ? cardNumber[0] : '';
    final firstTwoDigits = cardNumber.length > 1 ? cardNumber.substring(0, 2) : '';

    if (firstDigit == '4') {
      return 'Visa';
    } else if (firstTwoDigits == '34' || firstTwoDigits == '37') {
      return 'Amex';
    } else if (RegExp('^(51|52|53|54|55)').hasMatch(firstTwoDigits)) {
      return 'MasterCard';
    } else if (RegExp('^(60|62|64|65)').hasMatch(firstTwoDigits)) {
      return 'Discover';
    }
    return 'Unknown';
  }
}
