/*
 * Project      : tmt_common_base
 * File         : encryption_helper.dart
 * Description  : 
 * Author       : kannappan
 * Date         : 2025-02-18
 * Version      : 1.0
 * Ticket       : 
 */

import 'dart:convert';
import 'package:crypto/crypto.dart';

class EncryptionHelper {
  /// Encrypts a string using SHA-256
  static String hashSHA256(String input) {
    final bytes = utf8.encode(input);
    return sha256.convert(bytes).toString();
  }

  /// Encrypts a string using SHA-512
  static String hashSHA512(String input) {
    final bytes = utf8.encode(input);
    return sha512.convert(bytes).toString();
  }
}
