/*
 * Project      : gudbuks
 * File         : app_pages.dart
 * Description  : GetX route definitions
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:coustome_pdf_web/features/demo/bindings/demo_binding.dart';
import 'package:coustome_pdf_web/features/demo/view/demo_screen.dart';
import 'package:get/get.dart';
import 'package:coustome_pdf_web/features/splash/bindings/splash_binding.dart';
import 'package:coustome_pdf_web/features/splash/view/splash_screen.dart';
import 'app_routes.dart';

/// Application pages configuration
class AppPages {
  AppPages._();

  /// Get all application routes
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => const DemoScreen(),
      binding: DemoBinding(),
      transition: Transition.fade,
    ),
  ];
}
