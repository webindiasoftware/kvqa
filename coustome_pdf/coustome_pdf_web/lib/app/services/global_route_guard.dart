// /*
//  * Project      : gudbuks
//  * File         : global_route_guard.dart
//  * Description  : Global route guard for handling direct URL access and authentication
//  * Author       : kannappan
//  * Date         : 2025-12-05
//  * Version      : 1.0
//  * Ticket       :
//  */
//
// import 'package:get/get.dart';
// import 'package:coustome_pdf_web/routes/app_pages.dart';
// import 'package:coustome_pdf_web/routes/app_routes.dart';
// import 'package:common_base/utils/logger.dart';
//
// import '../utils/app_session_manager.dart';
//
// class GlobalRouteGuard extends GetxService {
//   final AppSessionManager _sessionManager = AppSessionManager();
//
//   // Routes that don't require authentication
//   static const List<String> _publicRoutes = [
//     AppRoutes.getStarted,
//     AppRoutes.splash,
//     AppRoutes.loginOtp,
//     AppRoutes.planSelection,
//   ];
//
//   /// Check if a route requires authentication
//   bool requiresAuth(String route) {
//     return !_publicRoutes.contains(route);
//   }
//
//   /// Handle route changes and check authentication
//   Future<void> handleRouteChange(String route) async {
//     try {
//       // Skip check if route is empty or invalid
//       if (route.isEmpty || route == '/') {
//         return;
//       }
//
//       if (requiresAuth(route)) {
//         final isLoggedIn = await _sessionManager.isUserLoggedin();
//         if (!isLoggedIn) {
//           LogHelper.warning('Unauthorized access attempt to: $route - Redirecting to get started');
//           // Redirect to get started page
//           Get.offAllNamed(AppRoutes.getStarted);
//         }
//       }
//     } catch (e) {
//       LogHelper.error('Error in route guard for route $route: $e');
//       // On error, redirect to get started for safety
//       Get.offAllNamed(AppRoutes.getStarted);
//     }
//   }
//
//   /// Check current route and redirect if needed
//   Future<void> checkCurrentRoute() async {
//     try {
//       final currentRoute = Get.currentRoute;
//       if (currentRoute.isNotEmpty) {
//         await handleRouteChange(currentRoute);
//       }
//     } catch (e) {
//       LogHelper.error('Error checking current route: $e');
//     }
//   }
//
//   /// Initialize global route guard
//   void initialize() {
//     LogHelper.debug('Initializing GlobalRouteGuard');
//     // Configuration is already set in GetMaterialApp, no need to set here
//   }
// }