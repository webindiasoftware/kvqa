/*
 * Project      : gudbuks
 * File         : environment.dart
 * Description  : Environment enum and configuration
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

/// Environment types
enum Environment { development, staging, production }

/// Environment configuration
class EnvironmentConfig {
  final Environment environment;
  final String apiBaseUrl;
  final String appName;
  final bool enableLogging;
  final bool enableCrashReporting;
  final bool enableAnalytics;

  const EnvironmentConfig({
    required this.environment,
    required this.apiBaseUrl,
    required this.appName,
    this.enableLogging = true,
    this.enableCrashReporting = false,
    this.enableAnalytics = false,
  });

  /// Development environment configuration
  static const EnvironmentConfig development = EnvironmentConfig(
    environment: Environment.development,
    apiBaseUrl: 'https://maco.softskirl.co.in/MacoMMS/api',
    appName: 'MacoMMS Dev',
    enableLogging: true,
    enableCrashReporting: false,
    enableAnalytics: false,
  );

  /// Staging environment configuration
  static const EnvironmentConfig staging = EnvironmentConfig(
    environment: Environment.staging,
    apiBaseUrl: 'https://maco.softskirl.co.in/MacoMMS/api',
    appName: 'MacoMMS Staging',
    enableLogging: true,
    enableCrashReporting: true,
    enableAnalytics: false,
  );

  /// Production environment configuration
  static const EnvironmentConfig production = EnvironmentConfig(
    environment: Environment.production,
    apiBaseUrl: 'https://maco.softskirl.co.in/MacoMMS/api',
    appName: 'MacoMMS',
    enableLogging: false,
    enableCrashReporting: true,
    enableAnalytics: true,
  );

  /// Get environment from string
  static Environment fromString(String env) {
    switch (env.toLowerCase()) {
      case 'dev':
      case 'development':
        return Environment.development;
      case 'staging':
      case 'stage':
        return Environment.staging;
      case 'prod':
      case 'production':
        return Environment.production;
      default:
        return Environment.development;
    }
  }

  /// Get configuration for environment
  static EnvironmentConfig getConfig(Environment env) {
    switch (env) {
      case Environment.development:
        return development;
      case Environment.staging:
        return staging;
      case Environment.production:
        return production;
    }
  }

  /// Check if current environment is development
  bool get isDevelopment => environment == Environment.development;

  /// Check if current environment is staging
  bool get isStaging => environment == Environment.staging;

  /// Check if current environment is production
  bool get isProduction => environment == Environment.production;
}
