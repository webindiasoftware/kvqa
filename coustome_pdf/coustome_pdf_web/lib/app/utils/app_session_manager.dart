/*
 * Project      : gudbuks
 * File         : app_session_manager.dart
 * Description  : Session management utility for user authentication and preferences
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */


import 'package:common_base/storage/secure_storage_helper.dart';

/// Session management utility for user authentication and preferences
class AppSessionManager {
  static final String _KEY_USER_SESSION_ID = 'USER_SESSION_ID';
  static final String _KEY_USER_ID = 'USER_ID';
  static final String _KEY_USER_DETAILS = 'USER_DETAILS';
  static final String _KEY_AUTH_TOKEN = 'AUTH_TOKEN';
  static final String _KEY_REFRESH_TOKEN = 'REFRESH_TOKEN';

  final SecureStorageHelper _secureStorage = SecureStorageHelper();

  /// Check if user is logged in
  Future<bool> isUserLoggedin() async {
    try {
      final sessionId = await _secureStorage.read(_KEY_USER_SESSION_ID);
      return sessionId != null && sessionId.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  /// Save user session ID
  Future<void> saveUserSessionId(String sessionId) async {
    await _secureStorage.write(_KEY_USER_SESSION_ID, sessionId);
  }

  /// Get user session ID
  Future<String?> getUserSessionId() async {
    return await _secureStorage.read(_KEY_USER_SESSION_ID);
  }

  /// Clear user session
  Future<void> clearUserSession() async {
    await _secureStorage.delete(_KEY_USER_SESSION_ID);
    await _secureStorage.delete(_KEY_USER_ID);
    await _secureStorage.delete(_KEY_AUTH_TOKEN);
    await _secureStorage.delete(_KEY_REFRESH_TOKEN);
  }

  /// Save authentication token
  Future<void> saveAuthToken(String token) async {
    await _secureStorage.write(_KEY_AUTH_TOKEN, token);
  }

  /// Get authentication token
  Future<String?> getAuthToken() async {
    return await _secureStorage.read(_KEY_AUTH_TOKEN);
  }


  /// Save user Details
  Future<void> saveUserDetails(String userDetails) async {
    await _secureStorage.write(_KEY_USER_DETAILS, userDetails);
  }

  /// Get user Details
  Future<String?> getUserDetails() async {
    return await _secureStorage.read(_KEY_USER_DETAILS);
  }

  Future<void> clearAllSecureStorage() async {
    await _secureStorage.clearAll();
  }
}
