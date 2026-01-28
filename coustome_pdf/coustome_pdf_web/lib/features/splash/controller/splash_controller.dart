/*
 * Project      : gudbuks
 * File         : auth_controller.dart
 * Description  : Authentication controller using GetX
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:get/get.dart';
import 'package:coustome_pdf_web/app/api/domain/usecases/auth_usecase.dart';
import 'package:coustome_pdf_web/app/utils/app_session_manager.dart';
import 'package:coustome_pdf_web/common/show_progress.dart';
import 'package:local_auth/local_auth.dart';
import 'package:coustome_pdf_web/routes/app_routes.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../app/constants/app_constants.dart';

class SplashController extends GetxController {
  final AuthUseCases authUseCases;
  final LocalAuthentication _auth = LocalAuthentication();

  final RxBool isAuthenticating = false.obs;
  final RxString statusMessage = 'Initializing...'.obs;

  SplashController({required this.authUseCases});

  /// Navigate to next screen after delay
  void navigateToNext() async {
    await getAppDetails();
    await Future.delayed(
      Duration(seconds: AppConstants.loginSimulationDelaySeconds),
      () async {
        String? value = await AppSessionManager().getAuthToken();
        if (value == null || (value ?? '').isEmpty) {
          Get.offNamed(AppRoutes.loginScreen);
        } else {
          _startAuthentication();
        }
      },
    );
  }

  var packageName = "".obs;

  Future<void> getAppDetails() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // This will fetch your applicationId (e.g., com.example.macorms_app)
    packageName.value = packageInfo.packageName;
  }

  Future<void> _startAuthentication() async {
    isAuthenticating.value = true;

    try {
      final bool canCheckBiometrics = await _auth.canCheckBiometrics;
      final bool isDeviceSupported = await _auth.isDeviceSupported();

      if (!canCheckBiometrics || !isDeviceSupported) {
        statusMessage.value = 'Biometric not available';
        // await showErrorMessage('Error',statusMessage.value,);

        _goToDashboard();
        return;
      }

      statusMessage.value = 'Authenticating...';

      final bool isAuthenticated = await _auth.authenticate(
        localizedReason: 'Authenticate to continue',
        biometricOnly: false,
      );

      if (isAuthenticated) {
        statusMessage.value = 'Authentication success';
        _goToDashboard();
      } else {
        statusMessage.value = 'Authentication failed';
        await showErrorMessage('Error', 'Authentication failed');
        _tryAgain();
      }
    } catch (e) {
      statusMessage.value = 'Auth error';
      await showErrorMessage('Error', 'Auth error');

      // _goToLogin();
    } finally {
      isAuthenticating.value = false;
    }
  }

  void _goToDashboard() {
    // Get.offNamed(AppRoutes.dashboardScreen);
  }

  void _tryAgain() {
    Future.delayed(const Duration(milliseconds: 500), () {
      _startAuthentication();
    });
  }
}
