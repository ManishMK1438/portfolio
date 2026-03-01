import 'dart:developer' as dev;

class AppLogger {
  // Static method so you can call it anywhere without dependency injection if needed
  static void logError(String origin, dynamic error, [StackTrace? stackTrace]) {
    dev.log(
      '❌ ERROR at [$origin]: $error',
      name: 'UniversalPrinter',
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void logInfo(String message) {
    dev.log('ℹ️ INFO: $message', name: 'UniversalPrinter');
  }
}
