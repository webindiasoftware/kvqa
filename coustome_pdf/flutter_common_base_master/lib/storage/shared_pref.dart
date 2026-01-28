// /*
//  * Project      : mctc-supplychain
//  * File         : shared_pref.dart
//  * Description  :
//  * Author       : kannappan
//  * Date         : 2025-06-22
//  * Version      : 1.0
//  * Ticket       :
//  */
//
// import 'dart:convert';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPrefsHelper {
//   static final SharedPrefsHelper _instance = SharedPrefsHelper._internal();
//
//   factory SharedPrefsHelper() => _instance;
//
//   SharedPrefsHelper._internal();
//
//   SharedPreferences? _prefs;
//
//   Future<SharedPreferences> get _instanceAsync async {
//     return _prefs ??= await SharedPreferences.getInstance();
//   }
//
//   /// Write a string value
//   Future<void> writeString(String key, String value) async {
//     final prefs = await _instanceAsync;
//     await prefs.setString(key, value);
//   }
//
//   /// Read a string value
//   Future<String?> readString(String key) async {
//     final prefs = await _instanceAsync;
//     return prefs.getString(key);
//   }
//
//   /// Write a bool value
//   Future<void> writeBool(String key, bool value) async {
//     final prefs = await _instanceAsync;
//     await prefs.setBool(key, value);
//   }
//
//   /// Read a bool value
//   Future<bool?> readBool(String key) async {
//     final prefs = await _instanceAsync;
//     return prefs.getBool(key);
//   }
//
//   /// Write an int value
//   Future<void> writeInt(String key, int value) async {
//     final prefs = await _instanceAsync;
//     await prefs.setInt(key, value);
//   }
//
//   /// Read an int value
//   Future<int?> readInt(String key) async {
//     final prefs = await _instanceAsync;
//     return prefs.getInt(key);
//   }
//
//   /// Write a double value
//   Future<void> writeDouble(String key, double value) async {
//     final prefs = await _instanceAsync;
//     await prefs.setDouble(key, value);
//   }
//
//   /// Read a double value
//   Future<double?> readDouble(String key) async {
//     final prefs = await _instanceAsync;
//     return prefs.getDouble(key);
//   }
//
//   /// Write a list of strings
//   Future<void> writeStringList(String key, List<String> value) async {
//     final prefs = await _instanceAsync;
//     await prefs.setStringList(key, value);
//   }
//
//   /// Read a list of strings
//   Future<List<String>?> readStringList(String key) async {
//     final prefs = await _instanceAsync;
//     return prefs.getStringList(key);
//   }
//
//   /// Write a JSON-encoded object (Map)
//   Future<void> writeMap(String key, Map<String, dynamic> map) async {
//     final prefs = await _instanceAsync;
//     await prefs.setString(key, jsonEncode(map));
//   }
//
//   /// Read and decode a JSON-encoded object (Map)
//   Future<Map<String, dynamic>?> readMap(String key) async {
//     final prefs = await _instanceAsync;
//     final jsonString = prefs.getString(key);
//     if (jsonString == null) return null;
//     return jsonDecode(jsonString) as Map<String, dynamic>;
//   }
//
//   /// Remove a key
//   Future<void> remove(String key) async {
//     final prefs = await _instanceAsync;
//     await prefs.remove(key);
//   }
//
//   /// Clear all stored preferences
//   Future<void> clear() async {
//     final prefs = await _instanceAsync;
//     await prefs.clear();
//   }
//
//   /// Check if a key exists
//   Future<bool> containsKey(String key) async {
//     final prefs = await _instanceAsync;
//     return prefs.containsKey(key);
//   }
// }
//
