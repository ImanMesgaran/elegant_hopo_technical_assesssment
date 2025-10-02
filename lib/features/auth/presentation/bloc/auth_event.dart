import 'package:equatable/equatable.dart';

import 'package:elegant_hopo_technical_assessment/features/auth/domain/entities/credentials.dart';

/// Base class for all authentication events.
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// Check authentication status event
class CheckAuthStatusEvent extends AuthEvent {
  const CheckAuthStatusEvent();
}

/// Sign in event
class SignInEvent extends AuthEvent {
  const SignInEvent(this.credentials);

  /// The credentials to sign in with
  final Credentials credentials;

  @override
  List<Object?> get props => [credentials];
}

/// Sign up event
class SignUpEvent extends AuthEvent {
  const SignUpEvent({
    required this.email,
    required this.password,
    required this.username,
  });

  /// The email to sign up with
  final String email;

  /// The password to sign up with
  final String password;

  /// The username to sign up with
  final String username;

  @override
  List<Object?> get props => [email, password, username];
}

/// Sign out event
class SignOutEvent extends AuthEvent {
  const SignOutEvent();
}

/// Send password reset email event
class SendPasswordResetEmailEvent extends AuthEvent {
  const SendPasswordResetEmailEvent(this.email);

  /// The email to send the password reset to
  final String email;

  @override
  List<Object?> get props => [email];
}

/// Update profile event
class UpdateProfileEvent extends AuthEvent {
  const UpdateProfileEvent({this.username, this.email});

  /// The new username
  final String? username;

  /// The new email
  final String? email;

  @override
  List<Object?> get props => [username, email];
}

/// Change password event
class ChangePasswordEvent extends AuthEvent {
  const ChangePasswordEvent({
    required this.currentPassword,
    required this.newPassword,
  });

  /// The current password
  final String currentPassword;

  /// The new password
  final String newPassword;

  @override
  List<Object?> get props => [currentPassword, newPassword];
}

/// Delete account event
class DeleteAccountEvent extends AuthEvent {
  const DeleteAccountEvent(this.password);

  /// The password to confirm account deletion
  final String password;

  @override
  List<Object?> get props => [password];
}
