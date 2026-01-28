/*
 * Project      : mctc-supplychain
 * File         : httl_api_client.dart
 * Description  : HTTP API client for web platform with all HTTP methods
 * Author       : kannappan
 * Date         : 2025-06-22
 * Version      : 1.0
 * Ticket       : 
 */

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/logger.dart';

class HttpApiClient {
  /// GET request
  Future<http.Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      Uri uri = Uri.parse(endpoint);
      
      // Add query parameters if provided
      if (queryParameters != null && queryParameters.isNotEmpty) {
        uri = uri.replace(queryParameters: queryParameters.map(
          (key, value) => MapEntry(key, value.toString()),
        ));
      }

      final response = await http.get(
        uri,
        headers: headers,
      );
      
      LogHelper.debug(
        'GET Request to $endpoint: ${response.statusCode} - ${response.body}',
      );
      return response;
    } catch (e) {
      LogHelper.debug('Error occurred in GET request: $e');
      rethrow;
    }
  }

  /// POST request
  Future<http.Response> post(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      final defaultHeaders = {
        'Content-Type': 'application/json',
      };
      LogHelper.debug(
        'POST Request to $endpoint: Body - ${json.encode(data)}',
      );

      final mergedHeaders = {
        ...defaultHeaders,
        if (headers != null) ...headers,
      };

      final response = await http.post(
        Uri.parse(endpoint),
        body: data != null ? jsonEncode(data) : null,
        headers: mergedHeaders,
      );
      
      LogHelper.debug(
        'POST Request to $endpoint: ${response.statusCode} - ${response.body}',
      );
      return response;
    } catch (e) {
      LogHelper.debug('Error occurred in POST request: $e');
      rethrow;
    }
  }

  /// PUT request
  Future<http.Response> put(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.put(
        Uri.parse(endpoint),
        body: data != null ? jsonEncode(data) : null,
        headers: headers,
      );
      
      LogHelper.debug(
        'PUT Request to $endpoint: ${response.statusCode} - ${response.body}',
      );
      return response;
    } catch (e) {
      LogHelper.debug('Error occurred in PUT request: $e');
      rethrow;
    }
  }

  /// PATCH request
  Future<http.Response> patch(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.patch(
        Uri.parse(endpoint),
        body: data != null ? jsonEncode(data) : null,
        headers: headers,
      );
      
      LogHelper.debug(
        'PATCH Request to $endpoint: ${response.statusCode} - ${response.body}',
      );
      return response;
    } catch (e) {
      LogHelper.debug('Error occurred in PATCH request: $e');
      rethrow;
    }
  }

  /// DELETE request
  Future<http.Response> delete(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.delete(
        Uri.parse(endpoint),
        body: data != null ? jsonEncode(data) : null,
        headers: headers,
      );
      
      LogHelper.debug(
        'DELETE Request to $endpoint: ${response.statusCode} - ${response.body}',
      );
      return response;
    } catch (e) {
      LogHelper.debug('Error occurred in DELETE request: $e');
      rethrow;
    }
  }
}
