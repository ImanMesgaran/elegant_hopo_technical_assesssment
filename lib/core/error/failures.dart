import 'package:equatable/equatable.dart';

/// Base class for all failures in the application.
abstract class Failure extends Equatable {
  const Failure({required this.message, this.code});

  /// Error message describing the failure.
  final String message;

  /// Optional error code.
  final String? code;

  @override
  List<Object?> get props => [message, code];
}

/// Failure representing server-related errors.
class ServerFailure extends Failure {
  const ServerFailure({String message = 'Server error occurred', String? code})
    : super(message: message, code: code);
}

/// Failure representing network-related errors.
class NetworkFailure extends Failure {
  const NetworkFailure({
    String message = 'Network error occurred',
    String? code,
  }) : super(message: message, code: code);
}

/// Failure representing cache-related errors.
class CacheFailure extends Failure {
  const CacheFailure({String message = 'Cache error occurred', String? code})
    : super(message: message, code: code);
}

/// Failure representing validation errors.
class ValidationFailure extends Failure {
  const ValidationFailure({String message = 'Validation failed', String? code})
    : super(message: message, code: code);
}

/// Failure representing unknown errors.
class UnknownFailure extends Failure {
  const UnknownFailure({
    String message = 'An unknown error occurred',
    String? code,
  }) : super(message: message, code: code);
}
