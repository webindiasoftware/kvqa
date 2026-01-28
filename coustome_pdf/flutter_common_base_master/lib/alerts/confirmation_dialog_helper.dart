/*
 * Project      : tmt_common_base
 * File         : confirmation_dialog_helper.dart
 * Description  : 
 * Author       : kannappan
 * Date         : 2025-02-18
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:flutter/material.dart';

class ConfirmationDialogHelper {

  static Future<bool?> showConfirmationDialog(
    BuildContext context,
    String title,
    String content,
  ) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Negative
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Positive
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
