import 'package:equatable/equatable.dart';

abstract class AppException with EquatableMixin implements Exception {
  final String message;
  final String? prefix;

  AppException(this.message, this.prefix);

  @override
  String toString() {
    return '${prefix ?? 'AppException'}: $message';
  }

  @override
  List<Object?> get props => [message, prefix];
}

// 1. Thrown when Supabase returns an error (e.g., table not found, RLS policy blocked)
class ServerException extends AppException {
  ServerException([String message = 'A server error occurred'])
    : super(message, 'Server Exception');
}

// 2. Thrown when our JSON mapping fails (e.g., missing a key in the database)
class ParsingException extends AppException {
  ParsingException([String message = 'Failed to parse data'])
    : super(message, 'Parsing Exception');
}

// 3. Thrown when the device has no internet
class NetworkException extends AppException {
  NetworkException([String message = 'No internet connection'])
    : super(message, 'Network Exception');
}

// 4. A generic fallback for completely unexpected crashes

class UnknownException extends AppException {
  UnknownException([String message = 'An unexpected error occurred'])
    : super(message, 'Unknown Exception');
}
