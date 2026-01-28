/*
 * Project      : gudbuks
 * File         : app_constants.dart
 * Description  : Application-wide constants
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

/// Application-wide constants
class AppConstants {
  AppConstants._();

  // Splash screen
  static const int splashScreenDelaySeconds = 2;

  // Login simulation delay (remove when implementing actual login)
  static const int loginSimulationDelaySeconds = 1;

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultSpacing = 16.0;
  static const double largeSpacing = 24.0;
  static const double extraLargeSpacing = 48.0;
  static const double smallSpacing = 8.0;
  static const double mediumSpacing = 32.0;

  // Icon sizes
  static const double splashIconSize = 100.0;
  static const double defaultIconSize = 24.0;
  static const double smallIconSize = 20.0;

  // Border radius
  static const double defaultRadius = 8.0;
  static const double buttonRadius = 8.0;
  static const double cardRadius = 12.0;

  // Button padding
  static const double buttonHorizontalPadding = 20.0;
  static const double buttonVerticalPadding = 12.0;
  static const double buttonHeight = 50.0;

  // Header heights
  static const double headerHeight = 230.0;

  // Pattern spacing
  static const double patternSpacing = 40.0;
  static const double patternRadius = 8.0;
  static const double patternOpacity = 0.3;

  // OTP constants
  static const int otpLength = 6;
  static const int otpFieldWidth = 48;
  static const int otpResendTimerSeconds = 30;
  static const int otpResendTimerInitial = 30;

  // Mobile number constants
  static const int mobileNumberLength = 10;
  static const String countryCode = '+91';
  static const String country = 'IN';
  static const String defaultPhoneNumber = '90909 90909';

  // Plan selection
  static const int gridCrossAxisCount = 3;
  static const double featureIconSize = 64.0;
  static const double featureIconInnerSize = 32.0;
  static const int selectedPlanDefault = 0;

  // Text constants
  static const double letterSpacing = 1.2;
  static const double opacityLow = 0.4;
  static const double opacityMedium = 0.6;
  static const double opacityHigh = 0.8;
  static const int underlineBorderWidth = 2;

  // Note: Routes are defined in AppRoutes class
}
