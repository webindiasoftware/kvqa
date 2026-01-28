import 'package:flutter/services.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  final int decimalRange;
  final int? maxLengthBeforeDecimal;

  DecimalTextInputFormatter({this.decimalRange = 2, this.maxLengthBeforeDecimal})
      : assert(decimalRange >= 0);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final text = newValue.text;

    if (text == '') return newValue;

    // Only allow valid decimal input
    final regex = RegExp(r'^\d*\.?\d{0,' + decimalRange.toString() + r'}$');

    if (!regex.hasMatch(text)) {
      // Reject invalid input
      return oldValue;
    }

    // Check maxLengthBeforeDecimal if specified
    if (maxLengthBeforeDecimal != null) {
      final parts = text.split('.');
      final beforeDecimal = parts[0];
      if (beforeDecimal.length > maxLengthBeforeDecimal!) {
        // Reject if exceeds max length before decimal
        return oldValue;
      }
    }

    return newValue;
  }
}
