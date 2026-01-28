/*
 * Project      : gudbuks
 * File         : base_remote_datasource.dart
 * Description  : Base remote data source with common functionality
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:common_base/network/api_service.dart';
import 'package:common_base/utils/logger.dart';

import '../../../utils/app_session_manager.dart';
import '../model/api_error.dart';
import '../response/api_response.dart';

/// Base remote data source with common functionality
/// All remote data sources should extend this class
abstract class BaseRemoteDataSource {
  final ApiService _apiService = Get.find<ApiService>();
  final Connectivity _connectivity = Connectivity();
  final AppSessionManager _sessionManager = AppSessionManager();

  /// Check internet connectivity before making API calls
  Future<bool> _checkConnectivity() async {
    try {
      final connectivityResult = await _connectivity.checkConnectivity();
      final hasConnection = connectivityResult.any(
        (result) => result != ConnectivityResult.none,
      );

      if (!hasConnection) {
        LogHelper.info('No internet connection.');
      }

      return hasConnection;
    } catch (e) {
      LogHelper.error('Error checking connectivity: $e');
      return false;
    }
  }

  /// Get headers with Bearer token for authenticated requests
  Future<Map<String, dynamic>> _getAuthHeaders({
    Map<String, dynamic>? additionalHeaders,
  }) async {
    final headers = <String, dynamic>{
      'Content-Type': 'application/json',
      if (additionalHeaders != null) ...additionalHeaders,
    };

    // Add Bearer token if available
    final token = await _sessionManager.getAuthToken();
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
      LogHelper.debug('Added Bearer token to request headers');
    }

    return headers;
  }

  /// Execute a GET request
  Future<ApiResponse> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool requiresAuth = false,
  }) async {
    try {
      // Check internet connectivity
      final hasConnection = await _checkConnectivity();
      if (!hasConnection) {
        throw ApiError.noInternet();
      }

      LogHelper.info('GET Request to: $endpoint');

      // Get headers with auth token if required
      final requestHeaders = requiresAuth
          ? await _getAuthHeaders(additionalHeaders: headers)
          : headers ?? {'Content-Type': 'application/json'};

      final response = await _apiService.get(
        endpoint,
        params: queryParameters,
        headers: requestHeaders,
      );

      return _handleResponse(response);
    } on ApiError {
      rethrow;
    } on DioException catch (e) {
      LogHelper.error('DioException in GET request to $endpoint: $e');
      throw ApiError.fromDioException(e);
    } catch (e) {
      LogHelper.error('Error in GET request to $endpoint: $e');
      throw ApiError.serverError('Failed to fetch data: $e');
    }
  }

  /// Execute a POST request
  Future<ApiResponse> post(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    bool requiresAuth = false,
  }) async {
    try {
      // Check internet connectivity
      final hasConnection = await _checkConnectivity();
      if (!hasConnection) {
        throw ApiError.noInternet();
      }

      LogHelper.info('POST Request to: $endpoint');
      if (data != null) {
        LogHelper.debug('Request body: ${json.encode(data)}');
      }

      // Get headers with auth token if required
      final requestHeaders = requiresAuth
          ? await _getAuthHeaders(additionalHeaders: headers)
          : headers ?? {'Content-Type': 'application/json'};

      final response = await _apiService.post(
        endpoint,
        data: data,
        headers: requestHeaders,
      );

      return _handleResponse(response);
    } on ApiError {
      rethrow;
    } on DioException catch (e) {
      LogHelper.error('DioException in POST request to $endpoint: $e');
      throw ApiError.fromDioException(e);
    } catch (e) {
      LogHelper.error('Error in POST request to $endpoint: $e');
      throw ApiError.serverError('Failed to send data: $e');
    }
  }

  /// Execute a PUT request
  Future<ApiResponse> put(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    bool requiresAuth = false,
  }) async {
    try {
      // Check internet connectivity
      final hasConnection = await _checkConnectivity();
      if (!hasConnection) {
        throw ApiError.noInternet();
      }

      LogHelper.info('PUT Request to: $endpoint');
      if (data != null) {
        LogHelper.debug('Request body: ${json.encode(data)}');
      }

      // Get headers with auth token if required
      final requestHeaders = requiresAuth
          ? await _getAuthHeaders(additionalHeaders: headers)
          : headers ?? {'Content-Type': 'application/json'};

      final response = await _apiService.put(
        endpoint,
        data: data,
        headers: requestHeaders,
      );

      return _handleResponse(response);
    } on ApiError {
      rethrow;
    } on DioException catch (e) {
      LogHelper.error('DioException in PUT request to $endpoint: $e');
      throw ApiError.fromDioException(e);
    } catch (e) {
      LogHelper.error('Error in PUT request to $endpoint: $e');
      throw ApiError.serverError('Failed to update data: $e');
    }
  }

  /// Execute a DELETE request
  Future<ApiResponse> delete(
    String endpoint, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    bool requiresAuth = false,
  }) async {
    try {
      // Check internet connectivity
      final hasConnection = await _checkConnectivity();
      if (!hasConnection) {
        throw ApiError.noInternet();
      }

      LogHelper.info('DELETE Request to: $endpoint');

      // Get headers with auth token if required
      final requestHeaders = requiresAuth
          ? await _getAuthHeaders(additionalHeaders: headers)
          : headers ?? {'Content-Type': 'application/json'};

      final response = await _apiService.delete(
        endpoint,
        params: params,
        headers: requestHeaders,
      );

      return _handleResponse(response);
    } on ApiError {
      rethrow;
    } on DioException catch (e) {
      LogHelper.error('DioException in DELETE request to $endpoint: $e');
      throw ApiError.fromDioException(e);
    } catch (e) {
      LogHelper.error('Error in DELETE request to $endpoint: $e');
      throw ApiError.serverError('Failed to delete data: $e');
    }
  }

  /// Handle API response
  ApiResponse _handleResponse(Response response) {
    final statusCode = response.statusCode ?? 0;

    LogHelper.info('Response from API: Status $statusCode');

    if (statusCode >= 200 && statusCode < 300) {
      // Success response
      if (response.data is Map<String, dynamic>) {
        final jsonData = response.data as Map<String, dynamic>;
        LogHelper.debug('Response data: ${json.encode(jsonData)}');
        if (jsonData.containsKey('success')) {
          // success
          return ApiResponse.fromJson(jsonData);
        } else {
          // failure
          return ApiResponse(success: true, data: jsonData, message: '');
        }
      } else if (response.data is String && response.data.isNotEmpty) {
        // If response is a string, try to parse it as JSON
        try {
          final jsonData = json.decode(response.data);
          LogHelper.debug('Response data (parsed): ${json.encode(jsonData)}');
          if (jsonData is Map<String, dynamic>) {
            return ApiResponse.fromJson(jsonData);
          }
        } catch (e) {
          LogHelper.warning('Failed to parse response as JSON: $e');
        }
      }

      // If response doesn't match expected format, create a success response
      Map<String, dynamic>? dataMap;
      if (response.data != null) {
        if (response.data is Map<String, dynamic>) {
          dataMap = response.data as Map<String, dynamic>;
        } else {
          dataMap = {'value': response.data};
        }
      }

      return ApiResponse(success: true, data: dataMap);
    } else {
      // Error response
      final errorData = response.data;
      String message = 'Request failed with status $statusCode';

      if (errorData is Map<String, dynamic>) {
        message = errorData['message'] ?? message;
        LogHelper.error('API Error: $message');
        throw ApiError.serverError(
          message,
          statusCode: statusCode,
          data: errorData,
        );
      } else {
        LogHelper.error('API Error: $message');
        throw ApiError.serverError(message, statusCode: statusCode);
      }
    }
  }
}
