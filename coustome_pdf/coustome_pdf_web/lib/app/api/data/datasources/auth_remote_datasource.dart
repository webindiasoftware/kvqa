/*
 * Project      : gudbuks
 * File         : auth_remote_datasource.dart
 * Description  : Remote data source for authentication
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:common_base/utils/logger.dart';
import 'package:coustome_pdf_web/app/utils/app_session_manager.dart';

import '../../api_constants.dart';
import '../model/api_error.dart';
import '../model/request/login_request.dart';
import '../response/api_response.dart';
import 'base_remote_datasource.dart';

/// Remote data source for authentication API calls
class AuthRemoteDataSource extends BaseRemoteDataSource {
  AppSessionManager mAppSessionManager = AppSessionManager();

  /// Request postLogin
  Future<ApiResponse> postLogin(LoginRequest request) async {
    try {
      LogHelper.info(
        'RequestUrl: ${ApiConstant.baseUrl + ApiConstant.loginWithOtp}',
      );
      LogHelper.info('Requesting Login: ${request.toString()}');

      final apiResponse = await post(
        ApiConstant.baseUrl + ApiConstant.loginWithOtp,
        data: request.toJson(),
        requiresAuth: false,
      );

      return apiResponse;
    } on ApiError catch (e) {
      LogHelper.error('API Error in requestOtp: ${e.message}');
      // Return error response
      return ApiResponse(success: false, message: e.message, data: null);
    } catch (e) {
      LogHelper.error('Unexpected error in requestOtp: $e');
      return ApiResponse(
        success: false,
        message: 'An unexpected error occurred',
        data: null,
      );
    }
  }


}
