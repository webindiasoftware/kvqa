/*
 * Project      : tmt_common_base
 * File         : formatters.dart
 * Description  : 
 * Author       : kannappan
 * Date         : 2025-02-18
 * Version      : 1.0
 * Ticket       : 
 */
import 'package:intl/intl.dart';

class Formatters {
  /// Formats a phone number (1234567890 → (123) 456-7890)
  static String formatPhoneNumber(String phone) {
    if (phone.length != 10) return phone;
    return '(${phone.substring(0, 3)}) ${phone.substring(3, 6)}-${phone.substring(6)}';
  }

  /// Formats a date to "dd-MM-yyyy"
  static String formatDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  /// Formats a number with comma separators
  static String formatNumber(int number) {
    return NumberFormat("#,###").format(number);
  }

  /// Converts a double to currency format (e.g., $1,234.56)
  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }
}
