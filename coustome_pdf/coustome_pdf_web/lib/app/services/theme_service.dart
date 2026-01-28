/*
 * Project      : gudbuks
 * File         : theme_service.dart
 * Description  : Theme service for managing light/dark theme switching
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:common_base/storage/secure_storage_helper.dart';
import 'package:common_base/storage/shared_pref.dart';
import 'package:common_base/utils/logger.dart';

class ThemeService extends GetxController {
  static const String _themeKey = 'app_theme_mode';

  final _themeMode = ThemeMode.light.obs;
  late final SecureStorageHelper _secureStorage;

  @override
  void onInit() {
    super.onInit();
    _secureStorage = Get.find<SecureStorageHelper>();
    _loadThemeMode();
  }

  /// Get current theme mode
  ThemeMode get themeMode => _themeMode.value;

  /// Get current theme mode as observable
  Rx<ThemeMode> get themeModeRx => _themeMode;

  /// Check if current theme is dark
  bool get isDarkMode => _themeMode.value == ThemeMode.dark;

  /// Check if current theme is light
  bool get isLightMode => _themeMode.value == ThemeMode.light;

  /// Check if current theme is system
  bool get isSystemMode => _themeMode.value == ThemeMode.system;

  /// Switch to light theme
  Future<void> switchToLightTheme() async {
    await _setThemeMode(ThemeMode.light);
  }

  /// Switch to dark theme
  Future<void> switchToDarkTheme() async {
    await _setThemeMode(ThemeMode.dark);
  }

  /// Switch to system theme
  Future<void> switchToSystemTheme() async {
    await _setThemeMode(ThemeMode.system);
  }

  /// Toggle between light and dark theme
  Future<void> toggleTheme() async {
    if (_themeMode.value == ThemeMode.light) {
      await switchToDarkTheme();
    } else if (_themeMode.value == ThemeMode.dark) {
      await switchToLightTheme();
    } else {
      // If system mode, switch to light
      await switchToLightTheme();
    }
  }

  /// Set theme mode
  Future<void> _setThemeMode(ThemeMode mode) async {
    try {
      _themeMode.value = mode;
      await _saveThemeMode(mode);
      Get.changeThemeMode(mode);
      update(); // Notify GetBuilder to rebuild
      LogHelper.info('Theme switched to: ${mode.name}');
    } catch (e) {
      LogHelper.error('Error switching theme: $e');
    }
  }

  /// Load theme mode from storage
  Future<void> _loadThemeMode() async {
    try {
      String? themeString = await _secureStorage.read(_themeKey);

      if (themeString != null) {
        final mode = _parseThemeMode(themeString);
        _themeMode.value = mode;
        LogHelper.info('Theme loaded from storage: ${mode.name}');
      } else {
        // Default to light theme
        _themeMode.value = ThemeMode.light;
        LogHelper.info('No saved theme found, using default: light');
      }
    } catch (e) {
      LogHelper.error('Error loading theme: $e');
      _themeMode.value = ThemeMode.light;
    }
  }

  /// Save theme mode to storage
  Future<void> _saveThemeMode(ThemeMode mode) async {
    try {
      await _secureStorage.write(_themeKey, mode.name);
      LogHelper.debug('Theme saved to storage: ${mode.name}');
    } catch (e) {
      LogHelper.error('Error saving theme: $e');
    }
  }

  /// Parse theme mode from string
  ThemeMode _parseThemeMode(String themeString) {
    switch (themeString.toLowerCase()) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }

  /// Get theme mode name for display
  String getThemeModeName(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }

  /// Get theme mode icon
  IconData getThemeModeIcon(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
      case ThemeMode.system:
        return Icons.brightness_auto;
    }
  }

  /// Get all available theme modes
  List<ThemeMode> get availableThemeModes => [
    ThemeMode.light,
    ThemeMode.dark,
    ThemeMode.system,
  ];
}
