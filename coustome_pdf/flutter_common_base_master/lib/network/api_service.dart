/*
 * Project      : tmt_common_base
 * File         : api_service.dart
 * Description  : 
 * Author       : kannappan
 * Date         : 2025-02-18
 * Version      : 1.0
 * Ticket       : 
 */

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../utils/logger.dart';
import 'http_api_client.dart';
import 'network.dart';

class ApiService {
  final Dio _dio = Network().dio;
  final HttpApiClient _httpClient = HttpApiClient();

  /// Get the base URL from Network instance
  String get _baseUrl => Network().dio.options.baseUrl;

  // GET request with logs and optional headers
  Future<Response> get(String endpoint, {Map<String, dynamic>? params, Map<String, dynamic>? headers}) async {
    try {
      Response response;

      if (kIsWeb) {
        // For web platform, use HttpApiClient with full URL
        final fullUrl = '$_baseUrl$endpoint';
        final httpResponse = await _httpClient.get(
          fullUrl,
          queryParameters: params,
          headers: headers?.map((key, value) => MapEntry(key, value.toString())),
        );

        // Convert http.Response to dio.Response
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          statusCode: httpResponse.statusCode,
          data: httpResponse.body.isNotEmpty
              ? _parseResponseBody(httpResponse.body)
              : null,
          headers: Headers.fromMap(
            httpResponse.headers.map((key, value) => MapEntry(key, [value])),
          ),
        );
      } else {
        // For mobile/desktop platforms, use Dio
        var options = Options(headers: headers);
        response = await _dio.get(endpoint, queryParameters: params, options: options);
      }

      LogHelper.debug(
        'GET Request to $endpoint: ${response.statusCode} - ${response.data}',
      );
      return response;
    } catch (e) {
      LogHelper.debug('Error occurred: $e');
      rethrow;
    }
  }

  // POST request with logs and optional headers
  Future<Response> post(String endpoint, {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      Response response;

      if (kIsWeb) {
        // For web platform, use HttpApiClient with full URL
        final fullUrl = '$_baseUrl$endpoint';
        final httpResponse = await _httpClient.post(
          fullUrl,
          data: data,
          headers: headers?.map((key, value) => MapEntry(key, value.toString())),
        );

        // Convert http.Response to dio.Response
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          statusCode: httpResponse.statusCode,
          data: httpResponse.body.isNotEmpty
              ? _parseResponseBody(httpResponse.body)
              : null,
          headers: Headers.fromMap(
            httpResponse.headers.map((key, value) => MapEntry(key, [value])),
          ),
        );
      } else {
        // For mobile/desktop platforms, use Dio
        var options = Options(headers: headers);
        response = await _dio.post(endpoint, data: data, options: options);
      }

      LogHelper.debug(
        'POST Request to $endpoint: ${response.statusCode} - ${response.data}',
      );
      return response;
    } catch (e) {
      LogHelper.debug('Error occurred: $e');
      rethrow;
    }
  }

  // PUT request with logs and optional headers
  Future<Response> put(String endpoint, {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      Response response;

      if (kIsWeb) {
        // For web platform, use HttpApiClient with full URL
        final fullUrl = '$_baseUrl$endpoint';
        final httpResponse = await _httpClient.put(
          fullUrl,
          data: data,
          headers: headers?.map((key, value) => MapEntry(key, value.toString())),
        );

        // Convert http.Response to dio.Response
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          statusCode: httpResponse.statusCode,
          data: httpResponse.body.isNotEmpty
              ? _parseResponseBody(httpResponse.body)
              : null,
          headers: Headers.fromMap(
            httpResponse.headers.map((key, value) => MapEntry(key, [value])),
          ),
        );
      } else {
        // For mobile/desktop platforms, use Dio
        var options = Options(headers: headers);
        response = await _dio.put(endpoint, data: data, options: options);
      }

      LogHelper.debug(
        'PUT Request to $endpoint: ${response.statusCode} - ${response.data}',
      );
      return response;
    } catch (e) {
      LogHelper.debug('Error occurred: $e');
      rethrow;
    }
  }

  // DELETE request with logs and optional headers
  Future<Response> delete(
      String endpoint, {
        Map<String, dynamic>? params, Map<String, dynamic>? headers,
      }) async {
    try {
      Response response;

      if (kIsWeb) {
        // For web platform, use HttpApiClient with full URL
        final fullUrl = '$_baseUrl$endpoint';
        final httpResponse = await _httpClient.delete(
          fullUrl,
          data: params, // http package uses body for DELETE
          headers: headers?.map((key, value) => MapEntry(key, value.toString())),
        );

        // Convert http.Response to dio.Response
        response = Response(
          requestOptions: RequestOptions(path: endpoint),
          statusCode: httpResponse.statusCode,
          data: httpResponse.body.isNotEmpty
              ? _parseResponseBody(httpResponse.body)
              : null,
          headers: Headers.fromMap(
            httpResponse.headers.map((key, value) => MapEntry(key, [value])),
          ),
        );
      } else {
        // For mobile/desktop platforms, use Dio
        var options = Options(headers: headers);
        response = await _dio.delete(endpoint, queryParameters: params, options: options);
      }

      LogHelper.debug(
        'DELETE Request to $endpoint: ${response.statusCode} - ${response.data}',
      );
      return response;
    } catch (e) {
      LogHelper.debug('Error occurred: $e');
      rethrow;
    }
  }

  /// Parse response body from string to appropriate type (JSON, etc.)
  dynamic _parseResponseBody(String body) {
    try {
      // Try to parse as JSON first
      return body.startsWith('{') || body.startsWith('[')
          ? _parseJson(body)
          : body;
    } catch (e) {
      // If parsing fails, return as string
      LogHelper.debug('Failed to parse response body as JSON: $e');
      return body;
    }
  }

  /// Parse JSON string safely
  dynamic _parseJson(String jsonString) {
    try {
      return jsonDecode(jsonString);
    } catch (e) {
      LogHelper.debug('JSON decode error: $e');
      return jsonString;
    }
  }
}

