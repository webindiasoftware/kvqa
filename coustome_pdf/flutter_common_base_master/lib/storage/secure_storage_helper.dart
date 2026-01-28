/*
 * Project      : tmt_common_base
 * File         : secure_storage_helper.dart
 * Description  : 
 * Author       : kannappan
 * Date         : 2025-02-18
 * Version      : 1.0
 * Ticket       : 
 */

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  // Create a singleton instance
  static final SecureStorageHelper _instance = SecureStorageHelper._internal();

  factory SecureStorageHelper() => _instance;

  SecureStorageHelper._internal();

  // Initialize secure storage
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// Save data to secure storage
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Save data to secure storage
  Future<void> writeMap(String key, Map<String, dynamic> value) async {
    await _storage.write(key: key, value: jsonEncode(value));
  }

  /// Read data from secure storage
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  /// Read data from secure storage
  Future<Map<String, dynamic>?> readMap(String key) async {
    String? value = await _storage.read(key: key);
    return jsonDecode(value ?? '');
  }

  /// Delete data from secure storage
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  /// Clear all storage keys
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  /// Check if a key exists
  Future<bool> containsKey(String key) async {
    final value = await read(key);
    return value != null;
  }
}
