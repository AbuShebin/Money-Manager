import 'package:flutter/services.dart';

class InputFormattersConstants {
  static final phoneNumberFormatter = [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(10),
  ];

  static final postalCodeFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(6),
  ];

  static final decimalAndNoOnly = [
    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
  ];
  static final integerOnly = [FilteringTextInputFormatter.digitsOnly];
}
