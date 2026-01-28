/*
 * Project      : gudbuks
 * File         : api_error.dart
 * Description  : Common API error model
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:dio/dio.dart';

/// Common API error model
class ApiError implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiError({
    required this.message,
    this.statusCode,
    this.data,
  });

  /// Create from DioException
  factory ApiError.fromDioException(dynamic error) {
    if (error is DioException) {
      final statusCode = error.response?.statusCode;
      final errorData = error.response?.data;
      String message = 'An error occurred';

      if (errorData is Map<String, dynamic>) {
        message = errorData['message'] ?? error.message ?? message;
      } else if (error.message != null) {
        message = error.message!;
      }

      return ApiError(
        message: message,
        statusCode: statusCode,
        data: errorData,
      );
    }

    return ApiError(
      message: error.toString(),
    );
  }

  /// Create from network error (no connectivity)
  factory ApiError.noInternet() {
    return ApiError(
      message: 'No internet connection. Please check your network settings.',
      statusCode: null,
    );
  }

  /// Create from server error
  factory ApiError.serverError(String message, {int? statusCode, dynamic data}) {
    return ApiError(
      message: message,
      statusCode: statusCode,
      data: data,
    );
  }

  @override
  String toString() => 'ApiError(message: $message, statusCode: $statusCode)';
}

