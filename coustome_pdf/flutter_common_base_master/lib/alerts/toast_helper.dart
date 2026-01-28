/*
 * Project      : tmt_common_base
 * File         : toast_helper.dart
 * Description  : 
 * Author       : kannappan
 * Date         : 2025-02-18
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper {
  static void showToast(String message, {Toast length = Toast.LENGTH_SHORT}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: length,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
