/*
 * Project      : gudbuks
 * File         : environment_manager.dart
 * Description  : Environment manager for managing app environments
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'environment.dart';

/// Environment manager singleton
class EnvironmentManager extends GetxService {
  static EnvironmentManager? _instance;
  static EnvironmentConfig? _currentConfig;

  EnvironmentManager._();

  /// Get singleton instance
  factory EnvironmentManager() {
    _instance ??= EnvironmentManager._();
    return _instance!;
  }

  /// Initialize environment
  /// Reads from compile-time constant or defaults to development
  static void initialize() {
    const String envString = String.fromEnvironment(
      'ENVIRONMENT',
      defaultValue: 'development',
    );

    final environment = EnvironmentConfig.fromString(envString);
    _currentConfig = EnvironmentConfig.getConfig(environment);

    if (kDebugMode) {
      print('🌍 Environment: ${_currentConfig!.environment.name}');
      print('🔗 API Base URL: ${_currentConfig!.apiBaseUrl}');
      print('📱 App Name: ${_currentConfig!.appName}');
    }
  }

  /// Get current environment configuration
  static EnvironmentConfig get current {
    if (_currentConfig == null) {
      initialize();
    }
    return _currentConfig!;
  }

  /// Get current environment
  static Environment get environment => current.environment;

  /// Get API base URL
  static String get apiBaseUrl => current.apiBaseUrl;

  /// Get app name
  static String get appName => current.appName;

  /// Check if logging is enabled
  static bool get enableLogging => current.enableLogging;

  /// Check if crash reporting is enabled
  static bool get enableCrashReporting => current.enableCrashReporting;

  /// Check if analytics is enabled
  static bool get enableAnalytics => current.enableAnalytics;

  /// Check if development environment
  static bool get isDevelopment => current.isDevelopment;

  /// Check if staging environment
  static bool get isStaging => current.isStaging;

  /// Check if production environment
  static bool get isProduction => current.isProduction;
}

