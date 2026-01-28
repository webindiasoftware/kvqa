/*
 * Project      : gudbuks
 * File         : app_initializer.dart
 * Description  : Application initializer for dependency injection
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:common_base/alerts/notification_helper.dart';
import 'package:common_base/network/api_service.dart';
import 'package:common_base/network/network.dart';
import 'package:common_base/storage/secure_storage_helper.dart';
import 'package:common_base/storage/shared_pref.dart';
import 'package:common_base/utils/logger.dart';

import '../api/api_constants.dart';
import '../services/connectivity_service.dart';
import '../services/global_route_guard.dart';
import '../services/theme_service.dart';

class AppInitializer {
  static Future<void> init() async {
    try {

      // // Capture Flutter framework errors
      // FlutterError.onError =
      //     FirebaseCrashlytics.instance.recordFlutterFatalError;
      //
      // // Capture async errors
      // PlatformDispatcher.instance.onError = (error, stack) {
      //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      //   return true;
      // };

      // Initialize core services from tmt_common_base
      await _initCoreServices();

      // Initialize feature services
      await _initFeatureServices();

      LogHelper.info('App initialization completed successfully');
    } catch (e) {
      LogHelper.error('Error during app initialization: $e');
      rethrow;
    }
  }

  /// Initialize core services from tmt_common_base
  static Future<void> _initCoreServices() async {
    // Configure network base URL
    final network = Network();
    network.setBaseUrl(ApiConstant.baseUrl);

    // Register storage helpers first (required by ThemeService)
    Get.put<SecureStorageHelper>(SecureStorageHelper(), permanent: true);

    // Register API service from tmt_common_base
    Get.put<ApiService>(ApiService(), permanent: true);

    // Register ThemeService for theme management
    // Must be registered before runApp() so GetBuilder can access it
    Get.put<ThemeService>(ThemeService(), permanent: true);

    LogHelper.info(
        'Core services initialized with base URL: ${ApiConstant.baseUrl}');
  }

  // Initialize feature services
  static Future<void> _initFeatureServices() async {
    // Initialize notification permissions (required for iOS/iPad)
    await _initializeNotifications();
    
    // Register global route guard
    // Get.put<GlobalRouteGuard>(GlobalRouteGuard(), permanent: true);

    // Register connectivity service (GetXService is automatically permanent)
    Get.put(ConnectivityService());

    LogHelper.info('Feature services initialized');
  }
  
  /// Initialize notification permissions (required for iOS/iPad)
  static Future<void> _initializeNotifications() async {
    try {
      // final granted = await NotificationHelper.initialize();
      // if (granted) {
      //   LogHelper.info('Notification permissions granted');
      // } else {
      //   LogHelper.warning('Notification permissions denied');
      // }
    } catch (e) {
      LogHelper.error('Error initializing notifications: $e');
      // Don't throw - notifications are not critical for app startup
    }
  }

  /// Dispose all services
  static void dispose() {
    try {
      Get.deleteAll();
      LogHelper.info('All services disposed');
    } catch (e) {
      LogHelper.error('Error disposing services: $e');
    }
  }

  // Check if all services are initialized
  static bool get isInitialized {
    return Get.isRegistered<ApiService>();
  }

  /// Get service instance
  static T getService<T>() {
    if (!Get.isRegistered<T>()) {
      throw Exception('Service $T is not registered');
    }
    return Get.find<T>();
  }

  /// Register service if not already registered
  static void registerService<T>(T service, {bool permanent = false}) {
    if (!Get.isRegistered<T>()) {
      Get.put<T>(service, permanent: permanent);
    }
  }

  /// Unregister service
  static void unregisterService<T>() {
    if (Get.isRegistered<T>()) {
      Get.delete<T>();
    }
  }

}
