/*
 * Project      : gudbuks
 * File         : main.dart
 * Description  : Application entry point with error handling and initialization
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:coustome_pdf_web/features/user_app.dart';
import 'package:common_base/utils/logger.dart';
import 'app/config/environment_manager.dart';
import 'app/initializer/app_initializer.dart';
import 'app/localization/translation_service.dart';
import 'app/services/crash_reporting_service.dart';
import 'package:logging/logging.dart';

import 'app/constants/app_color_constants.dart';
import 'app/web/config/multi_tab_guard_web.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  // This line removes the '#' from the URL
  usePathUrlStrategy();
  // Setup global error handlers BEFORE any other initialization
  _setupGlobalErrorHandlers();

  _disableDebugLogs();

  // Run app in error zone to catch all unhandled errors
  runZonedGuarded(
        () async {
      // Initialize Flutter bindings inside the zone
      WidgetsFlutterBinding.ensureInitialized();

      // Set fullscreen mode after bindings are initialized
      _fullscreenMode();

      // Initialize environment FIRST
      EnvironmentManager.initialize();

      // Initialize translations from JSON files (must be before other services)
      await _initializeTranslations();

      // Initialize services and dependencies
      await _initializeServices();

      ///SystemChrome
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColorConstants.primaryBackgroundColor,
      ));
      if (kIsWeb && !kDebugMode) {
        preventMultiTab();
      }

      runApp(UserApp());
    },
        (error, stack) {
      // Handle all uncaught errors from the zone
      _handleZoneError(error, stack);
    },
  );
}

/// Setup global error handlers for Flutter framework errors
void _setupGlobalErrorHandlers() {
  final crashReporting = CrashReportingService();

  // Handle Flutter framework errors
  FlutterError.onError = (FlutterErrorDetails details) {
    // In debug mode, show error on screen
    FlutterError.presentError(details);

    // Log and report the error
    LogHelper.error('Flutter Error: ${details.exception}');
    LogHelper.error('Stack Trace: ${details.stack}');

    // Report to crash reporting service
    crashReporting.recordError(
      details.exception,
      details.stack,
      context: {
        'library': details.library,
        'context': details.context?.toString() ?? 'No context',
      },
      fatal: false, // Flutter errors are usually non-fatal
    );
  };

  // Handle errors outside of Flutter framework
  PlatformDispatcher.instance.onError = (error, stack) {
    LogHelper.error('Platform Error: $error');
    LogHelper.error('Stack Trace: $stack');

    // Report to crash reporting service
    crashReporting.recordError(
      error,
      stack,
      context: {'type': 'PlatformError'},
      fatal: true, // Platform errors are usually fatal
    );

    return true; // Return true to prevent app termination
  };
}

/// Handle errors caught in the zone
void _handleZoneError(Object error, StackTrace stack) {
  final crashReporting = CrashReportingService();

  LogHelper.error('Zone Error: $error');
  LogHelper.error('Stack Trace: $stack');

  // Report to crash reporting service
  crashReporting.recordError(
    error,
    stack,
    context: {'type': 'ZoneError'},
    fatal: true,
  );
}

/// Initialize translations from JSON files
/// This must be called before runApp() to ensure translations are loaded
Future<void> _initializeTranslations() async {
  try {
    await TranslationService.init();
    LogHelper.info('Translations initialized successfully');
  } catch (e, stackTrace) {
    LogHelper.error('Error initializing translations: $e');
    // Report to crash reporting service
    CrashReportingService().recordError(
      e,
      stackTrace,
      context: {'phase': 'translation_initialization'},
      fatal: false,
    );
  }
}

Future<void> _initializeServices() async {
  try {
    // Initialize app dependencies
    await AppInitializer.init();

    // Set up user context for crash reporting (if available)
    // Example: CrashReportingService().setUserId(userId);

    LogHelper.info('App initialization completed successfully');
  } catch (e, stackTrace) {
    // Log initialization errors
    LogHelper.error('Error initializing services: $e');
    LogHelper.error('Stack Trace: $stackTrace');

    // Report to crash reporting service
    CrashReportingService().recordError(
      e,
      stackTrace,
      context: {'phase': 'initialization'},
      fatal: false,
    );
  }
}

void _fullscreenMode() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

void _disableDebugLogs() {
  // Set logging level based on build mode
  if (kDebugMode) {
    // In debug mode, log everything
    Logger.root.level = Level.ALL;
  } else {
    // In production, only log warnings and errors
    Logger.root.level = Level.WARNING;

    // Disable debugPrint in production
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  // Configure logger output
  Logger.root.onRecord.listen((record) {
    if (kDebugMode || record.level >= Level.WARNING) {
      debugPrint(
          '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
    }
  });
}
