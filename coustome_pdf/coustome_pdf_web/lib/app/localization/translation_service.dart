/*
 * Project      : gudbuks
 * File         : translation_service.dart
 * Description  : Translation service for managing app localization
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:common_base/utils/logger.dart';

import 'data/language.dart';

class TranslationService extends Translations {
  static Map<String, Map<String, String>> _translations = {};

  static Locale? get locale => const Locale('en', 'US');
  static const fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => _translations;

  /// Initialize translations by loading JSON files from assets
  /// This should be called before runApp() in main.dart
  static Future<void> init() async {
    try {
      // List of supported languages (matching Excel column headers)
      final languageFiles = [
        'en_US',
        'el_GR',
      ];

      _translations.clear();

      for (var lang in languageFiles) {
        try {
          final jsonString = await rootBundle.loadString(
            'assets/lang/generated/$lang.json',
          );
          final Map<String, dynamic> decoded = jsonDecode(jsonString);
          _translations[lang] = Map<String, String>.from(
            decoded.map((key, value) => MapEntry(key, value.toString())),
          );
        } catch (e) {
          // If JSON file doesn't exist or is invalid, log error but continue
          LogHelper.debug('Warning: Could not load $lang.json: $e');
          // Initialize with empty map to prevent errors
          _translations[lang] = {};
        }
      }

      LogHelper.debug('✓ Translations loaded: ${_translations.keys.toList()}');
    } catch (e) {
      LogHelper.debug('Error initializing translations: $e');
      // Fallback to empty translations to prevent app crash
      _translations = {
        'en_US': {},
        'el_GR': {},
      };
    }
  }

  static final List<Language> _languages = [
    const Language(
      code: 'el',
      name: 'Greek',
      nativeName: 'Ελληνικά',
      flagAsset: 'assets/images/flags/el.png',
    ),
    const Language(
      code: 'en',
      name: 'English',
      nativeName: 'English',
      flagAsset: 'assets/images/flags/en.png',
    ),
  ];

  static List<Language> get availableLanguages => _languages;

  static Language? getLanguageByCode(String code) {
    return _languages.firstWhere(
          (lang) => lang.code == code,
      orElse: () => _languages.first,
    );
  }

  static void addLanguage(Language language) {
    if (!_languages.any((lang) => lang.code == language.code)) {
      _languages.add(language);
    }
  }

  static void removeLanguage(String code) {
    _languages.removeWhere((lang) => lang.code == code);
  }
}
