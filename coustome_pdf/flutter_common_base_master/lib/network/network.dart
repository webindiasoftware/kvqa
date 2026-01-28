/*
 * Project      : tmt_common_base
 * File         : network.dart
 * Description  : 
 * Author       : kannappan
 * Date         : 2025-02-18
 * Version      : 1.0
 * Ticket       : 
 */

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../utils/logger.dart';
import 'api_analytics_interceptor.dart';

class Network {
  // Singleton pattern to ensure only one instance of Dio is used across the app
  static final Network _instance = Network._internal();

  factory Network() {
    return _instance;
  }

  late Dio _dio;

  Network._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: '',
        connectTimeout: Duration(seconds: 30), // Connection timeout
        receiveTimeout: Duration(seconds: 30), // Response timeout
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    )
      ..httpClientAdapter = IOHttpClientAdapter();

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      HttpClient client = HttpClient();
      client.badCertificateCallback = (X509Certificate cert, String host, int port) {
        LogHelper.warning('Accepting certificate for $host:$port');
        return true;
      };

      // // SECURITY: Only allow bad certificates in debug mode
      // // In production, all certificates must be valid to prevent MITM attacks
      // if (kDebugMode) {
      //   // Allow all certificates in debug mode for development/testing
      //   client.badCertificateCallback = (X509Certificate cert, String host, int port) {
      //     LogHelper.warning('Accepting certificate in DEBUG mode for $host:$port');
      //     return true;
      //   };
      // } else {
      //   // In production, reject invalid certificates
      //   // No callback set means default validation (strict)
      //   LogHelper.info('Certificate validation enabled (production mode)');
      // }
      
      return client;
    };

    // Add custom logger as interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Log request using LogHelper
          LogHelper.info('Request: ${options.method} ${options.uri}');
          LogHelper.info('Headers: ${options.headers}');
          if (options.data != null) {
            LogHelper.logLargeString("Body", jsonEncode(options.data));
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Log response using LogHelper
          LogHelper.info('Response: ${response.statusCode}');
          LogHelper.info('Response Body: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // Log error using LogHelper
          LogHelper.error('Error: ${e.message}');
          if (e.response != null) {
            LogHelper.error('Error Status Code: ${e.response?.statusCode}');
            LogHelper.error('Error Response: ${e.response?.data}');
          }
          return handler.next(e);
        },
      ),
    );
    _dio.interceptors.add(ApiAnalyticsInterceptor());
  }

  Dio get dio => _dio;

  // Set the base URL dynamically from the app module
  void setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }
}
