import 'dart:developer' as dev;
import 'dart:io';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class AppLogger {
  static final Logger _logger = Logger('CamalotApp');
  static File? _logFile;
  static bool _isInitialized = false;
  static String _logFolderName = 'logs'; // Default folder name

  static Future<void> init({String? logFolderName}) async {
    if (_isInitialized) {
      dev.log('Logger already initialized', name: 'AppLogger');
      return;
    }

    try {
      // Update folder name if provided
      if (logFolderName != null) {
        _logFolderName = logFolderName;
      }

      // Get the application documents directory
      final appDir = await getApplicationDocumentsDirectory();
      dev.log('App directory: ${appDir.path}', name: 'AppLogger');

      // Create logs directory in app documents directory with custom folder name
      final logsDir = Directory(path.join(appDir.path, _logFolderName));
      if (!await logsDir.exists()) {
        await logsDir.create(recursive: true);
        dev.log('Created logs directory: ${logsDir.path}', name: 'AppLogger');
      }

      // Create the log file
      final filePath = path.join(logsDir.path, 'camalot_logs.txt');
      dev.log('Creating log file at: $filePath', name: 'AppLogger');

      _logFile = File(filePath);

      // Ensure the file exists
      if (!await _logFile!.exists()) {
        dev.log('Log file does not exist, creating...', name: 'AppLogger');
        await _logFile!.create(recursive: true);
        dev.log('Created log file', name: 'AppLogger');
      } else {
        dev.log('Log file already exists', name: 'AppLogger');
      }

      // Test write
      await _logFile!.writeAsString('Logger initialized at ${DateTime.now()}\n',
          mode: FileMode.append);
      dev.log('Test write successful', name: 'AppLogger');

      // Set up logging
      Logger.root.level = Level.ALL;
      Logger.root.onRecord.listen((record) {
        // Print to console with proper formatting
        final message =
            '${record.level.name}: ${record.time}: ${record.message}';
        dev.log(message, name: record.loggerName);

        // Write to file
        _writeToFile('$message\n');
      });

      _isInitialized = true;
      dev.log('Logger initialized successfully', name: 'AppLogger');

      // Test logging
      info('Test log message');
      warning('Test warning message');
      error('Test error message');
      debug('Test debug message');
    } catch (e, stackTrace) {
      dev.log('Failed to initialize logger: $e\n$stackTrace',
          name: 'AppLogger', error: e, stackTrace: stackTrace);
    }
  }

  static Future<void> _writeToFile(String message) async {
    if (_logFile != null) {
      try {
        await _logFile!.writeAsString(message, mode: FileMode.append);
        dev.log('Wrote to log file: ${message.trim()}', name: 'AppLogger');
      } catch (e, stackTrace) {
        dev.log('Failed to write to log file: $e\n$stackTrace',
            name: 'AppLogger', error: e, stackTrace: stackTrace);
      }
    } else {
      dev.log('Log file is null, cannot write', name: 'AppLogger');
    }
  }

  // Log levels
  static void info(String message) => _logger.info(message);
  static void warning(String message) => _logger.warning(message);
  static void error(String message) => _logger.severe(message);
  static void debug(String message) => _logger.fine(message);

  // Helper methods for common scenarios
  static void logError(String message,
      [Object? error, StackTrace? stackTrace]) {
    final errorMessage = error != null ? '$message\nError: $error' : message;
    if (stackTrace != null) {
      AppLogger.error('$errorMessage\nStack trace: $stackTrace');
    } else {
      AppLogger.error(errorMessage);
    }
  }

  static void logWarning(String message, [Object? error]) {
    final warningMessage =
        error != null ? '$message\nWarning: $error' : message;
    AppLogger.warning(warningMessage);
  }

  // Get logs from file
  static Future<String?> getLogs() async {
    if (_logFile != null && await _logFile!.exists()) {
      try {
        return await _logFile!.readAsString();
      } catch (e) {
        dev.log('Failed to read log file: $e', name: 'AppLogger');
      }
    }
    return null;
  }

  // Clear logs
  static Future<void> clearLogs() async {
    if (_logFile != null && await _logFile!.exists()) {
      try {
        await _logFile!.writeAsString('');
        info('Logs cleared');
      } catch (e) {
        dev.log('Failed to clear logs: $e', name: 'AppLogger');
      }
    }
  }
}
