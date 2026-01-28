/*
 * Project      : gudbuks
 * File         : request_otp_usecase.dart
 * Description  : Authentication use cases
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:coustome_pdf_web/app/api/data/model/request/add_item_request.dart';
import 'package:coustome_pdf_web/app/api/data/model/request/approve_reject_request.dart';
import 'package:coustome_pdf_web/app/api/data/model/request/item_view_request.dart';
import 'package:coustome_pdf_web/app/api/data/model/request/mechanic_accept_request.dart';
import 'package:coustome_pdf_web/app/api/data/model/request/requisition_request.dart';
import 'package:coustome_pdf_web/app/api/data/model/response/item_list_response.dart';

import '../../data/response/api_response.dart';
import '../repositories/auth_repository.dart';

/// Authentication use cases
class AuthUseCases {
  final AuthRepository _repository;

  AuthUseCases(this._repository);

  /// Request login
  Future<ApiResponse> postLogin(String userId, String password) async {
    return await _repository.postLogin(userId, password);
  }

}
