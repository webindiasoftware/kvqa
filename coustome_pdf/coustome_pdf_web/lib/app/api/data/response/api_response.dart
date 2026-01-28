/*
 * Project      : gudbuks
 * File         : api_response.dart
 * Description  : Common API response model
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

/// Common API response model
/// All API responses follow this structure:
/// {
///   "data": null,
///   "message": "string",
///   "success": true
/// }
class ApiResponse {
  final bool success;
  final String? message;
  final Map<String, dynamic>? data;

  ApiResponse({
    required this.success,
    this.message,
    this.data,
  });

  /// Create from JSON
  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'] ?? false,
      message: json['message'],
      data: json['data'] is Map<String, dynamic>
          ? json['data'] as Map<String, dynamic>
          : json['data'] != null
              ? {'value': json['data']}
              : null,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      if (message != null) 'message': message,
      if (data != null) 'data': data,
    };
  }

  @override
  String toString() => 'ApiResponse(success: $success, message: $message, data: $data)';
}

