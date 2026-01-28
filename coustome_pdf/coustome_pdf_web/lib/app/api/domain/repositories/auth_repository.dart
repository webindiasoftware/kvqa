/*
 * Project      : gudbuks
 * File         : auth_repository.dart
 * Description  : Authentication repository interface
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

abstract class AuthRepository {
  /// Request login
  Future<ApiResponse> postLogin(String userId, String password);

  ///logout
  Future<void> logout();
}
