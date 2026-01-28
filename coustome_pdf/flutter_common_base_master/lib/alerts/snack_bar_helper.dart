/*
 * Project      : tmt_common_base
 * File         : snack_bar_helper.dart
 * Description  : 
 * Author       : kannappan
 * Date         : 2025-02-18
 * Version      : 1.0
 * Ticket       : 
 */
import 'package:flutter/material.dart';

class SnackBarHelper {
  // Show a simple SnackBar
  static void showSnackBar(BuildContext context, String message, {Color? backgroundColor}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor ?? Colors.black,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Show SnackBar with action
  static void showSnackBarWithAction(
      BuildContext context,
      String message,
      String actionLabel,
      VoidCallback action,
      {Color? backgroundColor}
      ) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: actionLabel,
        onPressed: action,
      ),
      backgroundColor: backgroundColor ?? Colors.black,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
