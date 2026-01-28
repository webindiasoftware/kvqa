/*
 * Project      : gudbuks
 * File         : language.dart
 * Description  : Language model class
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

class Language {
  final String code;
  final String name;
  final String nativeName;
  final String flagAsset;

  const Language({
    required this.code,
    required this.name,
    required this.nativeName,
    required this.flagAsset,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      code: json['code'] as String,
      name: json['name'] as String,
      nativeName: json['nativeName'] as String,
      flagAsset: json['flagAsset'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'nativeName': nativeName,
      'flagAsset': flagAsset,
    };
  }
} 