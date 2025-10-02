import 'package:equatable/equatable.dart';

/// {@template failure}
/// Base class for all failures in the application.
/// {@endtemplate}
abstract class Failure extends Equatable {
  /// {@macro failure}
  const Failure({required this.message, this.code});

  /// Error message describing the failure.
  final String message;

  /// Optional error code.
  final String? code;

  @override
  List<Object?> get props => [message, code];
}

/// {@template server_failure}
/// Failure representing server-related errors.
/// {@endtemplate}
class ServerFailure extends Failure {
  /// {@macro server_failure}
  const ServerFailure({required super.message, super.code});
}

/// {@template network_failure}
/// Failure representing network-related errors.
/// {@endtemplate}
class NetworkFailure extends Failure {
  /// {@macro network_failure}
  const NetworkFailure({required super.message, super.code});
}

/// {@template cache_failure}
/// Failure representing cache-related errors.
/// {@endtemplate}
class CacheFailure extends Failure {
  /// {@macro cache_failure}
  const CacheFailure({required super.message, super.code});
}

/// {@template validation_failure}
/// Failure representing validation errors.
/// {@endtemplate}
class ValidationFailure extends Failure {
  /// {@macro validation_failure}
  const ValidationFailure({required super.message, super.code});
}

/// {@template unknown_failure}
/// Failure representing unknown errors.
/// {@endtemplate}
class UnknownFailure extends Failure {
  /// {@macro unknown_failure}
  const UnknownFailure({required super.message, super.code});
}
