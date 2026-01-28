/*
 * Project      : tmt_common_base
 * File         : device_info.dart
 * Description  : 
 * Author       : kannappan
 * Date         : 2025-02-18
 * Version      : 1.0
 * Ticket       : 
 */

import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  static Future<String> getDeviceModel() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return '${androidInfo.brand} ${androidInfo.model}';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return '${iosInfo.name} ${iosInfo.systemVersion}';
    }
    return 'Unknown Device';
  }
}
