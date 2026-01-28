/*
 * Project      : gudbuks
 * File         : dashboard_screen.dart
 * Description  : Splash screen - initial app screen
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       :
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coustome_pdf_web/app/constants/app_image_assets_constants.dart';
import 'package:coustome_pdf_web/app/constants/app_text_constants.dart';
import 'package:coustome_pdf_web/app/services/screen_security.dart';
import 'package:coustome_pdf_web/app/constants/app_color_constants.dart';
import 'package:coustome_pdf_web/common/text_styles_constants.dart';
import 'package:coustome_pdf_web/features/splash/controller/splash_controller.dart';
import 'package:focus_detector/focus_detector.dart';
import '../../../app/localization/translation_service_key.dart';

/// Splash page - initial screen
class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(1.sp),
          child: AppBar(
            backgroundColor: AppColorConstants.appBackground,
            elevation: 0,
          ),
        ),
        body: FocusDetector(
          onVisibilityGained: () async {
            if (GetPlatform.isAndroid) {
              // ScreenSecurity.enable();
            }
            controller.navigateToNext();
          },
          onVisibilityLost: () {
            Get.delete<SplashController>();
          },
          child:
          LayoutBuilder(
            builder: (context, constraints) {
              // Check if the screen width is mobile-sized
              bool isMobile = constraints.maxWidth < 800;

              return   Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppTextConstants.welcomeMessage,
                      style: GoogleFonts.poppins(
                        color: AppColorConstants.labelColor,
                        fontSize: isMobile ? 28.sp : 40.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Image.asset(
                    //   AppImageAssetsConstants.logo,
                    //   height: 200.h,
                    //   fit: BoxFit.fitHeight,
                    // ),
                    Obx(
                          () => Text(
                        controller.packageName.value,
                        style: getTextRegular(
                          size: 15.sp,
                          colors: Colors.transparent,
                          // colors: colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
