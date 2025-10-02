import 'package:equatable/equatable.dart';

import 'package:elegant_hopo_technical_assessment/features/auth/domain/entities/auth_user.dart';

/// Base class for all authentication states.
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Initial authentication state
class AuthInitialState extends AuthState {
  const AuthInitialState();
}

/// Authentication loading state
class AuthLoadingState extends AuthState {
  const AuthLoadingState();
}

/// Authenticated state
class AuthenticatedState extends AuthState {
  const AuthenticatedState(this.user);

  /// The authenticated user
  final AuthUser user;

  @override
  List<Object?> get props => [user];
}

/// Unauthenticated state
class UnauthenticatedState extends AuthState {
  const UnauthenticatedState();
}

/// Authentication error state
class AuthErrorState extends AuthState {
  const AuthErrorState(this.message);

  /// The error message
  final String message;

  @override
  List<Object?> get props => [message];
}
