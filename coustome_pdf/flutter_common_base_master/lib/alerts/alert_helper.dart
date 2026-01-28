/*
 * Project      : tmt_common_base
 * File         : alert_helper.dart
 * Description  : 
 * Author       : kannappan
 * Date         : 2025-02-18
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:flutter/material.dart';

class AlertHelper {

  static Future<void> showAlert(
    BuildContext context,
    String title,
    String message, {
    String? positiveText,
    String? negativeText,
    Function? onPositivePressed,
    Function? onNegativePressed,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            if (negativeText != null)
              TextButton(
                onPressed: () {
                  if (onNegativePressed != null) {
                    onNegativePressed();
                  }
                  Navigator.of(context).pop();
                },
                child: Text(negativeText),
              ),
            if (positiveText != null)
              TextButton(
                onPressed: () {
                  if (onPositivePressed != null) {
                    onPositivePressed();
                  }
                  Navigator.of(context).pop();
                },
                child: Text(positiveText),
              ),
          ],
        );
      },
    );
  }
}
