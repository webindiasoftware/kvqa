///partha paul
///screen_security
///23/12/25

import 'package:flutter/services.dart';

class ScreenSecurity {
  static const _channel = MethodChannel('screen_security');

  static Future<void> enable() async {
    await _channel.invokeMethod('secureOn');
  }

  static Future<void> disable() async {
    await _channel.invokeMethod('secureOff');
  }
}
