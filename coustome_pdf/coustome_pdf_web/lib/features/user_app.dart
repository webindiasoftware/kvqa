/*
 * Project      : gudbuks
 * File         : gudbuks_app.dart
 * Description  : Main application widget with GetX setup, routing, and theme management
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       :
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:coustome_pdf_web/app/services/analytics_service.dart';

import '../routes/app_pages.dart';
import '../routes/app_routes.dart';
import 'app_bindings.dart';
import '../app/localization/translation_service.dart';
import '../app/services/global_route_guard.dart';
import '../app/services/theme_service.dart';
import '../app/theme/theme.dart';
import '../app/utils/responsive_utils.dart';

class UserApp extends StatelessWidget {
  // final GlobalRouteGuard _routeGuard = GlobalRouteGuard();

  const UserApp({super.key});

  @override
  Widget build(BuildContext context) {
    final designSize = ResponsiveUtils.getScreenDesignSize(context, kIsWeb);

    return ScreenUtilInit(
      designSize: designSize,
      builder: (context, child) {
        return GetBuilder<ThemeService>(
          builder: (themeService) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              debugShowMaterialGrid: false,
              title: "",
              theme: ThemeUtil.lightTheme,
              darkTheme: ThemeUtil.darkTheme,
              themeMode: themeService.themeMode,
              initialRoute: AppRoutes.splash,
              getPages: AppPages.routes,
              defaultTransition: Transition.fade,
              locale: TranslationService.locale,
              fallbackLocale: TranslationService.fallbackLocale,
              translations: TranslationService(),
              initialBinding: AppBindings(),
              builder: (context, child) {
                return protectFromSettingsFontSize(context, child!);
              },
              navigatorObservers: [
                // AnalyticsService.observer,
               // GetObserver((_) => _handleRouteChange()),
              ],
              onInit: () {
                // _initializeRouteGuard();
              },
              onReady: () {
                // Check authentication immediately when app is ready
                // _checkInitialAuth();
              },
              localizationsDelegates: [
              ],
            );
          },
        );
      },
    );
  }

  MediaQuery protectFromSettingsFontSize(BuildContext context, Widget child) {
    final mediaQueryData = MediaQuery.of(context);
    // Font size change(either reduce or increase) from phone setting should not impact app font size
    final scale = mediaQueryData.textScaler.clamp(minScaleFactor: 1.0, maxScaleFactor: 1.0);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: scale),
      child: child,
    );
  }
}