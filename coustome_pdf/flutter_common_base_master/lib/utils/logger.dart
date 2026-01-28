/*
 * Project      : tmt_common_base
 * File         : logger.dart
 * Description  : 
 * Author       : kannappan
 * Date         : 2025-02-18
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:logger/logger.dart';

class LogHelper {
  static final Logger _logger = Logger();

  static void info(String message) => _logger.i(message);

  static void error(String message) => _logger.e(message);

  static void debug(String message) => _logger.d(message);

  static void warning(String message) {_logger.w(message);}

  static void severe(String message) {_logger.v(message);}

  static void fine(String message) => _logger.f(message);

  /// Log large strings by splitting them into chunks
  /// Flutter's debugPrint has a limit of ~1000 characters per line
  /// This method splits large strings into multiple log statements
  /// 
  /// [prefix] - Prefix text to add before the log (e.g., "Request JSON:")
  /// [content] - The string content to log (can be JSON, XML, or any long string)
  /// [maxChunkSize] - Maximum characters per chunk (default: 800 to stay under 1000 char limit)
  static void logLargeString(String prefix, String content, {int maxChunkSize = 800}) {
    if (content.length <= maxChunkSize) {
      debug('$prefix $content');
      return;
    }

    // Log header with total length
    debug('$prefix (${content.length} chars, split into chunks):');
    
    // Calculate total number of chunks
    final totalChunks = (content.length / maxChunkSize).ceil();
    
    // Split into chunks and log each
    int chunkIndex = 0;
    for (int i = 0; i < content.length; i += maxChunkSize) {
      final end = (i + maxChunkSize < content.length) 
          ? i + maxChunkSize 
          : content.length;
      final chunk = content.substring(i, end);
      chunkIndex++;
      debug('  [Chunk $chunkIndex/$totalChunks] $chunk');
    }
    
    debug('$prefix [END]');
  }
}
