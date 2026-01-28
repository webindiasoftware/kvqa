/*
 * Project      : gudbuks
 * File         : crash_reporting_service.dart
 * Description  : Crash reporting service wrapper for Firebase Crashlytics
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:flutter/foundation.dart';
import 'package:common_base/utils/logger.dart';

// Firebase Crashlytics - uncomment when dependencies are added
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';

/// Crash reporting service
/// Abstraction layer over Firebase Crashlytics for easier maintenance and future migration
/// 
/// Benefits:
/// - Single point of control for crash reporting logic
/// - Easy to switch services (Firebase, Sentry, etc.) without changing app code
/// - Can add filtering, aggregation, or custom logic before reporting
/// - Consistent API across the app
class CrashReportingService {
  static final CrashReportingService _instance = CrashReportingService._internal();
  
  factory CrashReportingService() => _instance;
  
  CrashReportingService._internal();
  
  // Check if Firebase Crashlytics is available
  bool get _isFirebaseAvailable {
    // Uncomment when Firebase is integrated:
    // return FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled;
    return false;
  }

  /// Report a fatal error (app crash)
  Future<void> recordFatalError(
    Object error,
    StackTrace? stackTrace, {
    Map<String, dynamic>? context,
    bool fatal = true,
  }) async {
    try {
      final errorMessage = error.toString();
      final stackTraceString = stackTrace?.toString() ?? 'No stack trace available';
      
      // Always log locally for debugging
      LogHelper.error('=== FATAL ERROR ===');
      LogHelper.error('Error: $errorMessage');
      LogHelper.error('Stack Trace: $stackTraceString');
      if (context != null && context.isNotEmpty) {
        LogHelper.error('Context: $context');
      }
      LogHelper.error('==================');
      
      // Report to Firebase Crashlytics when available
      if (_isFirebaseAvailable) {
        // Uncomment when Firebase is integrated:
        // await FirebaseCrashlytics.instance.recordError(
        //   error,
        //   stackTrace,
        //   fatal: fatal,
        //   reason: errorMessage,
        // );
        // 
        // // Add context as custom keys
        // if (context != null) {
        //   context.forEach((key, value) {
        //     FirebaseCrashlytics.instance.setCustomKey(key, value.toString());
        //   });
        // }
      }
      
    } catch (e) {
      // Fail silently if crash reporting itself fails
      debugPrint('Failed to report crash: $e');
    }
  }

  /// Report a non-fatal error
  Future<void> recordError(
    Object error,
    StackTrace? stackTrace, {
    Map<String, dynamic>? context,
    bool fatal = false,
  }) async {
    await recordFatalError(error, stackTrace, context: context, fatal: fatal);
  }

  /// Log a custom message
  void log(String message, {Map<String, dynamic>? context}) {
    try {
      LogHelper.info('Crash Report: $message');
      if (context != null && context.isNotEmpty) {
        LogHelper.info('Context: $context');
      }
      
      if (_isFirebaseAvailable) {
        // Uncomment when Firebase is integrated:
        // FirebaseCrashlytics.instance.log(message);
      }
    } catch (e) {
      debugPrint('Failed to log crash report: $e');
    }
  }

  /// Set user identifier for crash reports
  void setUserId(String userId) {
    try {
      LogHelper.info('Setting crash report user ID: $userId');
      
      if (_isFirebaseAvailable) {
        // Uncomment when Firebase is integrated:
        // FirebaseCrashlytics.instance.setUserIdentifier(userId);
      }
    } catch (e) {
      debugPrint('Failed to set user ID: $e');
    }
  }

  /// Set custom key-value pairs for crash reports
  void setCustomKey(String key, dynamic value) {
    try {
      LogHelper.debug('Setting crash report key: $key = $value');
      
      if (_isFirebaseAvailable) {
        // Uncomment when Firebase is integrated:
        // FirebaseCrashlytics.instance.setCustomKey(key, value);
      }
    } catch (e) {
      debugPrint('Failed to set custom key: $e');
    }
  }
}

