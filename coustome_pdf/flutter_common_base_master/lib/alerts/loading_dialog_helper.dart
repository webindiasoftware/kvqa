/*
 * Project      : tmt_common_base
 * File         : loading_dialog_helper.dart
 * Description  : 
 * Author       : kannappan
 * Date         : 2025-02-18
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:flutter/material.dart';

class LoadingDialogHelper {
  // Show a loading dialog
  static Future<void> showLoadingDialog(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  // Dismiss the loading dialog
  static void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
