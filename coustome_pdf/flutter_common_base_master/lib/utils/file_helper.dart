/*
 * Project      : tmt_common_base
 * File         : file_helper.dart
 * Description  : 
 * Author       : kannappan
 * Date         : 2025-02-18
 * Version      : 1.0
 * Ticket       : 
 */

import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileHelper {
  /// Writes data to a file
  static Future<void> writeFile(String fileName, String content) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$fileName');
    await file.writeAsString(content);
  }

  /// Reads data from a file
  static Future<String?> readFile(String fileName) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$fileName');
      if (!file.existsSync()) return null;
      return await file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
