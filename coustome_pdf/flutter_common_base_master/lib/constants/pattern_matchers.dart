/*
 * Project      : tmt_common_base
 * File         : pattern_matchers.dart
 * Description  : 
 * Author       : kannappan
 * Date         : 2025-02-18
 * Version      : 1.0
 * Ticket       : 
 */

class PatternMatchersConstants {
  // Email Pattern
  static const String patternEmail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  // Mobile Number (10-12 digits)
  static const String patternMobile = r'^(?:[+0]9)?[0-9]{10,12}$';

  // Strong Password (Min 8 chars, Uppercase, Lowercase, Number, Special Character)
  static const String patternPassword =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*|_~`\=+\-[{},.?:;])(?=.{8,})';

  // String Patterns
  static const String patternStringCapsSpace = r'[A-Z ]';
  static const String patternStringCapsNumbers = r'[A-Z0-9]';
  static const String patternOnlyNumber = r'[0-9]';
  static const String patternOnlyNumberTime = r'[0-9:]';
  static const String patternDecimalNumber = r'^([0-9]+(\.?[0-9]?[0-9]?)?)';
  static const String patternTwoDecimalNumberOnly = r'(^\d*\.?\d{0,2})';
  static const String patternOnlyString = r'[a-zA-Z]';
  static const String patternStringAndSpace = r'[a-zA-Z ]';
  static const String patternStringAndSpaceDot = r'[a-zA-Z. ]';
  static const String patternEmailStringAtDot = r'[a-zA-Z0-9-.@_]';
  static const String patternStringNumber = r'[a-zA-Z0-9-]';
  static const String patternStringNumberSpace = r'[a-zA-Z0-9 ]';

  // URL Patterns
  static const String patternUrlLink = "[a-zA-Z0-9;,/?:@&=+\$-_.!~*'()#]";
  static const String patternWebUrl =
      r'(http|ftp|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?';

  // Other Patterns
  static const String patternAddress = "[a-zA-Z0-9.,/\' ]";
  static const String patternSkills = r'[a-zA-Z, ]';
  static const String patternCompanyRegNumber = r'[0-9A-Z-]';
  static const String patternCompanyName = r'[a-zA-Z0-9-. ]';

  // Emoji Removal
  static const String patternToRemoveEmoji =
      r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';
}
