import 'package:coustome_pdf_web/features/demo/controller/demo_controller.dart';
import 'package:get/get.dart';
import 'package:coustome_pdf_web/app/api/data/datasources/auth_remote_datasource.dart';
import 'package:coustome_pdf_web/app/api/data/repositories/auth_repository_impl.dart';
import 'package:coustome_pdf_web/app/api/domain/usecases/auth_usecase.dart';

/// Auth binding for dependency injection
class DemoBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: Initialize your dependencies here
    // Example:
    final authRemoteDataSource = AuthRemoteDataSource();
    final authRepository = AuthRepositoryImpl(
      remoteDataSource: authRemoteDataSource,
    );
    final authUseCases = AuthUseCases(authRepository);

    Get.lazyPut<DemoController>(
      () => DemoController(
        authUseCases: authUseCases,
      ),
    );
  }
}
