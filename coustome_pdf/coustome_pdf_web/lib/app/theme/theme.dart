/*
 * Project      : gudbuks
 * File         : theme.dart
 * Description  : App theme configuration with design system colors and fonts
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_constants.dart';
import '../constants/app_color_constants.dart';

/// Theme utility class
class ThemeUtil {
  ThemeUtil._();

  // Font families from design system
  static String get fontFamilypoppins =>
      GoogleFonts.poppins().fontFamily!;

  static String get fontFamilyFigtree => GoogleFonts.figtree().fontFamily!;

  static String get fontFamilyFigtreeSans => GoogleFonts.figtree().fontFamily!;

  /// Light theme
  static ThemeData get lightTheme => ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: _lightColorScheme,
    scaffoldBackgroundColor: AppColorConstants.primaryBackgroundColor,
    textTheme: _buildTextTheme(),
    appBarTheme: _buildAppBarThemeLight(_lightColorScheme),
    elevatedButtonTheme: _buildElevatedButtonTheme(
      _lightColorScheme.primary,
      _lightColorScheme.onPrimary,
    ),
    outlinedButtonTheme: _buildOutlinedButtonTheme(_lightColorScheme.primary),
    textButtonTheme: _buildTextButtonTheme(_lightColorScheme.primary),
    inputDecorationTheme: _buildInputDecorationTheme(
      _lightColorScheme,
      _lightColorScheme.primary,
    ),
    cardTheme: _buildCardTheme(_lightColorScheme),
  );

  /// Dark theme
  static ThemeData get darkTheme => ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: _darkColorScheme,
    scaffoldBackgroundColor:AppColorConstants.primaryBackgroundColor,
    textTheme: _buildTextTheme(),
    appBarTheme: _buildAppBarTheme(_darkColorScheme),
    elevatedButtonTheme: _buildElevatedButtonTheme(
      _darkColorScheme.primary,
      _darkColorScheme.onPrimary,
    ),
    outlinedButtonTheme: _buildOutlinedButtonTheme(_darkColorScheme.primary),
    textButtonTheme: _buildTextButtonTheme(_darkColorScheme.primary),
    inputDecorationTheme: _buildInputDecorationTheme(
      _darkColorScheme,
      _darkColorScheme.primary,
    ),
    cardTheme: _buildCardTheme(_darkColorScheme),
  );

  /// Light color scheme (Adjusted for visibility)
  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,

    // Primary Brand
    primary: AppColorConstants.primaryAccent,
    // Neon Green
    onPrimary: AppColorConstants.appBackground,
    // Black text on neon

    // Secondary / Accent
    secondary: AppColorConstants.accentBlue,
    // Blue accent
    onSecondary: AppColorConstants.primaryButtonText,
    // White text

    // Surfaces & Backgrounds
    surface: AppColorConstants.cardSurface,
    // Cards
    onSurface: AppColorConstants.primaryText,
    // Main text
    background: AppColorConstants.appBackground,
    onBackground: AppColorConstants.primaryText,

    // Error / Destructive
    error: AppColorConstants.destructiveError,
    onError: AppColorConstants.primaryButtonText,

    // Outline / Borders
    outline: AppColorConstants.inputBorder,

    // Containers
    surfaceContainer: AppColorConstants.cardSurface,
  );

  /// Dark color scheme (Matches Design System Image)
  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,

    // Primary Brand
    primary: AppColorConstants.primaryAccent,
    // Neon Green
    onPrimary: AppColorConstants.appBackground,
    // Black text on neon

    // Secondary / Accent
    secondary: AppColorConstants.pressedGreen,
    // Active green
    onSecondary: AppColorConstants.primaryText,

    // Surfaces & Backgrounds
    surface: AppColorConstants.appBarColor,
    // Dark surface
    onSurface: AppColorConstants.primaryButtonText,
    // White text
    background: AppColorConstants.appBarColor,
    onBackground: AppColorConstants.primaryButtonText,

    // Error / Destructive
    error: AppColorConstants.destructiveError,
    onError: AppColorConstants.primaryButtonText,

    // Outline / Borders
    outline: AppColorConstants.dividerColor,

    // Containers
    surfaceContainer: AppColorConstants.cardSurface,
    onSurfaceVariant: AppColorConstants.secondaryText,
  );

  /// Build app bar theme for light mode
  static AppBarTheme _buildAppBarThemeLight(ColorScheme scheme) => AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
    centerTitle: true,
  );

  /// Build app bar theme for dark mode
  static AppBarTheme _buildAppBarTheme(ColorScheme scheme) => AppBarTheme(
    foregroundColor: Colors.white,
    backgroundColor: Colors.black,
    elevation: 0,
    centerTitle: true,
  );

  /// Build elevated button theme
  static ElevatedButtonThemeData _buildElevatedButtonTheme(
    Color backgroundColor,
    Color foregroundColor,
  ) => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      padding: _getButtonPadding(),
      textStyle: _textTheme.bodyLarge?.copyWith(
        color: foregroundColor,
        fontFamily: fontFamilyFigtree,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.buttonRadius),
      ),
    ),
  );

  /// Build outlined button theme
  static OutlinedButtonThemeData _buildOutlinedButtonTheme(Color color) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          side: BorderSide(color: color, width: 1),
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.buttonHorizontalPadding,
            vertical: AppConstants.buttonVerticalPadding,
          ),
          textStyle: _textTheme.bodyLarge?.copyWith(
            fontFamily: fontFamilyFigtree,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.buttonRadius),
          ),
        ),
      );

  /// Build text button theme
  static TextButtonThemeData _buildTextButtonTheme(Color color) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: color,
          textStyle: _textTheme.bodyLarge?.copyWith(
            fontFamily: fontFamilyFigtree,
          ),
        ),
      );

  /// Get button padding based on platform
  static EdgeInsets _getButtonPadding() {
    if (kIsWeb) {
      return const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding * 2,
        vertical: AppConstants.defaultPadding * 1.2,
      );
    } else {
      return const EdgeInsets.symmetric(
        horizontal: AppConstants.buttonHorizontalPadding,
        vertical: AppConstants.buttonVerticalPadding,
      );
    }
  }

  /// Build input decoration theme
  static InputDecorationTheme _buildInputDecorationTheme(
    ColorScheme colorScheme,
    Color focusColor,
  ) => InputDecorationTheme(
    filled: true,
    fillColor: colorScheme.surfaceContainerHighest,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.outline),
      borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.primary),
      borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
    ),
    hintStyle: _textTheme.bodyLarge?.copyWith(
      color: colorScheme.onSurface.withOpacity(0.5),
      fontFamily: fontFamilyFigtree,
    ),
  );

  /// Build card theme
  static CardThemeData _buildCardTheme(ColorScheme colorScheme) =>
      CardThemeData(
        color: colorScheme.surfaceContainerHighest,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.cardRadius),
        ),
        margin: const EdgeInsets.all(AppConstants.defaultSpacing),
      );

  /// Build text theme based on design system
  /// Primary Heading: regular - Instrument Serif 32/32
  /// Heading: Semibold - Figtree 18/13
  /// Label Heading: Regular - Figtree 16/19
  /// TEXT: Regular - Figtree Sans 14/18
  /// Label: Regular - Figtree 12/19
  static TextTheme _buildTextTheme() {
    return TextTheme(
      // Primary Heading - Instrument Serif 32/32
      displayLarge: TextStyle(
        fontSize: 32.sp,
        height: 32 / 32,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamilypoppins,
      ),
      // Heading - Semibold Figtree 18/13
      headlineMedium: TextStyle(
        fontSize: 18.sp,
        height: 13 / 18,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamilyFigtree,
      ),
      // Label Heading - Regular Figtree 16/19
      titleLarge: TextStyle(
        fontSize: 16.sp,
        height: 19 / 16,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamilyFigtree,
      ),
      // TEXT - Regular Figtree Sans 14/18
      bodyLarge: TextStyle(
        fontSize: 14.sp,
        height: 18 / 14,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamilyFigtreeSans,
      ),
      // Label - Regular Figtree 12/19
      bodySmall: TextStyle(
        fontSize: 12.sp,
        height: 19 / 12,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamilyFigtree,
      ),
      // Additional text styles for compatibility
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        height: 32 / 32,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamilypoppins,
      ),
      headlineSmall: TextStyle(
        fontSize: 18.sp,
        height: 13 / 18,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamilyFigtree,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        height: 19 / 16,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamilyFigtree,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        height: 18 / 14,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamilyFigtree,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        height: 18 / 14,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamilyFigtreeSans,
      ),
      labelLarge: TextStyle(
        fontSize: 12.sp,
        height: 19 / 12,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamilyFigtree,
      ),
      labelMedium: TextStyle(
        fontSize: 12.sp,
        height: 19 / 12,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamilyFigtree,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        height: 19 / 12,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamilyFigtree,
      ),
    );
  }

  /// Text theme reference for use in button styles
  static TextTheme get _textTheme => _buildTextTheme();
}
