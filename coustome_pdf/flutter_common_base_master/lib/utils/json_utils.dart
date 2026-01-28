/*
 * Project      : tmt_common_base
 * File         : json_utils.dart
 * Description  : 
 * Author       : kannappan
 * Date         : 2025-02-18
 * Version      : 1.0
 * Ticket       : 
 */

import 'dart:convert';

class JsonUtils {
  static String encode(dynamic data) => json.encode(data);

  static dynamic decode(String jsonStr) => json.decode(jsonStr);
}
