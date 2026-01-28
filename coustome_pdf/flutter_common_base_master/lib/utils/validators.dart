/*
 * Project      : tmt_common_base
 * File         : validators.dart
 * Description  : 
 * Author       : kannappan
 * Date         : 2025-02-18
 * Version      : 1.0
 * Ticket       : 
 */

import '../constants/pattern_matchers.dart';

class Validators {
  // Validate Email
  static bool isValidEmail(String email) {
    final regex = RegExp(PatternMatchersConstants.patternEmail);
    return regex.hasMatch(email);
  }

  // Validate Mobile Number
  static bool isValidMobile(String mobile) {
    final regex = RegExp(PatternMatchersConstants.patternMobile);
    return regex.hasMatch(mobile);
  }

  // Validate Strong Password
  static bool isValidPassword(String password) {
    final regex = RegExp(PatternMatchersConstants.patternPassword);
    return regex.hasMatch(password);
  }

  // Validate if a string contains only numbers
  static bool isOnlyNumber(String input) {
    final regex = RegExp(PatternMatchersConstants.patternOnlyNumber);
    return regex.hasMatch(input);
  }

  // Validate if a string contains only alphabets
  static bool isOnlyString(String input) {
    final regex = RegExp(PatternMatchersConstants.patternOnlyString);
    return regex.hasMatch(input);
  }

  // Validate URL
  static bool isValidUrl(String url) {
    final regex = RegExp(PatternMatchersConstants.patternWebUrl);
    return regex.hasMatch(url);
  }

  // Remove Emojis
  static String removeEmojis(String input) {
    final regex = RegExp(PatternMatchersConstants.patternToRemoveEmoji);
    return input.replaceAll(regex, '');
  }

  static bool isValid(String source, String text) {
    final regex = RegExp(source);
    return regex.hasMatch(text);
  }
}
