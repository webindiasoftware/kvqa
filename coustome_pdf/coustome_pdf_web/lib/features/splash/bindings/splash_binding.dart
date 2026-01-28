/*
 * Project      : gudbuks
 * File         : auth_binding.dart
 * Description  : GetX binding for authentication module dependency injection
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:get/get.dart';
import 'package:coustome_pdf_web/app/api/data/datasources/auth_remote_datasource.dart';
import 'package:coustome_pdf_web/app/api/data/repositories/auth_repository_impl.dart';
import 'package:coustome_pdf_web/app/api/domain/usecases/auth_usecase.dart';
import 'package:coustome_pdf_web/features/splash/controller/splash_controller.dart';

/// Auth binding for dependency injection
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: Initialize your dependencies here
    // Example:
    final authRemoteDataSource = AuthRemoteDataSource();
    final authRepository = AuthRepositoryImpl(
      remoteDataSource: authRemoteDataSource,
    );
    final authUseCases = AuthUseCases(authRepository);

    Get.lazyPut<SplashController>(
      () => SplashController(
        authUseCases: authUseCases,
      ),
    );
  }
}
