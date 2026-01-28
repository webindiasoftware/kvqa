/*
 * Project      : gudbuks
 * File         : app_utils.dart
 * Description  : App utility functions
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../localization/translation_service_key.dart';

/// SnackBar types for different notification styles
enum SnackBarType {
  error,
  warning,
  success,
}

class AppUtils {
  static const int maxLengthOfMultilineText = 100;
  static const int maxLengthOfText = 20;
  static const int numberOfFisherMan = 2;
  bool isTabletView = false;


  static Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return 'V${packageInfo.version}';
  }

  static void showSnackBar(
    String message, {
    SnackBarType type = SnackBarType.error,
    Duration? duration,
    String? title,
  }) {
    Color backgroundColor = Colors.red;
    String defaultTitle = sError.tr;
    
    switch (type) {
      case SnackBarType.error:
        backgroundColor = Colors.red;
        defaultTitle = sError.tr;
        break;
      case SnackBarType.warning:
        backgroundColor = Colors.orange;
        defaultTitle = sWarning.tr;
        break;
      case SnackBarType.success:
        backgroundColor = Colors.green;
        defaultTitle = sSuccess.tr;
        break;
    }

    final snackTitle = title ?? defaultTitle;
    final textColor = Colors.white;

    Get.snackbar(
      snackTitle,
      message,
      snackPosition: SnackPosition.TOP,
      duration: duration ?? const Duration(seconds: 3),
      backgroundColor: backgroundColor,
      colorText: textColor,
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      titleText: Text(
        snackTitle,
        style: Theme.of(Get.context!).textTheme.titleLarge?.copyWith(
              color: textColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
            ),
      ),
      messageText: Text(
        message,
        style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(
              color: textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
            ),
      ),
    );
  }



}