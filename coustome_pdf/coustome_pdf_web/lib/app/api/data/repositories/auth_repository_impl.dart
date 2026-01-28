/*
 * Project      : gudbuks
 * File         : auth_repository_impl.dart
 * Description  : Implementation of authentication repository
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

import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../model/request/login_request.dart';
import '../response/api_response.dart';

/// Implementation of AuthRepository
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<ApiResponse> postLogin(String userId, String password) async {
    final request = LoginRequest(empId: userId, password: password);
    return await _remoteDataSource.postLogin(request);
  }


  @override
  Future<void> logout() {
    throw UnimplementedError();
  }
}
