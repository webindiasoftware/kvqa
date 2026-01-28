///partha paul
///date_picker_utils
///08/01/26
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class DatePickerUtils {
  DatePickerUtils._(); // private constructor

  /// Opens calendar dialog and returns formatted date (dd/MM/yyyy)
  static Future<String?> pickDate({
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final DateTime now = DateTime.now();

    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: initialDate ?? now,
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2100),
    );

    if (pickedDate != null) {
      return DateFormat('dd/MM/yyyy').format(pickedDate);
    }
    return null;
  }

  static String todayDate() {
    return DateFormat('dd/MM/yyyy').format(DateTime.now());
  }


  static String convertDate(String inputDate) {
    // inputDate format: dd/MM/yyyy
    DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(inputDate);

    // convert to yyyy-MM-dd
    String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);

    return formattedDate;
  }

  static String formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return "";

    try {
      // 1. Parse the input string into a DateTime object
      DateTime dateTime = DateTime.parse(dateString);

      // 2. Format it to 'MMM dd yyyy' (e.g., Jan 08 2026)
      return DateFormat('MMM dd yyyy').format(dateTime);
    } catch (e) {
      return dateString; // Return original if parsing fails
    }
  }

  ///dd/MM/yyyy
  static String formatDateEdit(String? dateString) {
    if (dateString == null || dateString.isEmpty) return "";

    try {
      // 1. Parse the input string into a DateTime object
      DateTime dateTime = DateTime.parse(dateString);

      // 2. Format it to 'MMM dd yyyy' (e.g., Jan 08 2026)
      return DateFormat('dd/MM/yyyy').format(dateTime);
    } catch (e) {
      return dateString; // Return original if parsing fails
    }
  }
}
