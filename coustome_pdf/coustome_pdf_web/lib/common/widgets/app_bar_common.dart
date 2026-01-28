import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///partha paul
///app_bar
///08/12/25
class AppBarsCommon {
  AppBarsCommon._();

  static PreferredSizeWidget appNoBar({Color? backgroundColor}) {
    final theme = Theme.of(Get.context!);
    final colorScheme = theme.colorScheme;
    return PreferredSize(
      preferredSize: Size.fromHeight(0.50.sp),
      child: AppBar(
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   // Status bar color
        //   statusBarColor: AppColorConstants.appBar,
        //
        //   // Status bar brightness (optional)
        //   statusBarIconBrightness:
        //   Brightness.dark, // For Android (dark icons)
        //   statusBarBrightness: Brightness.light, // For iOS (dark icons)
        // ),
        backgroundColor:
            backgroundColor ??
            colorScheme.secondaryFixed.withValues(alpha: 0.90),
      ),
    );
  }
}
