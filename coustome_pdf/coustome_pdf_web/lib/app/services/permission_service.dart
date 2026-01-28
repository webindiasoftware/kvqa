///partha paul
///permission_service
///24/12/25

import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  /// Check and request camera permission
  static Future<bool> requestCamera() async {
    final status = await Permission.camera.status;
    if (status.isGranted) return true;

    final result = await Permission.camera.request();
    return result.isGranted;
  }

  /// Check and request gallery/storage permission
  static Future<bool> requestGallery() async {
    final status = await Permission.photos.status; // iOS
    final storageStatus = await Permission.storage.status; // Android

    if (status.isGranted || storageStatus.isGranted) return true;

    final result = await Permission.photos.request(); // iOS
    final storageResult = await Permission.storage.request(); // Android
    return result.isGranted || storageResult.isGranted;
  }
}
