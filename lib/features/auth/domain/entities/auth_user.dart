import 'package:equatable/equatable.dart';

/// Entity representing an authenticated user.
class AuthUser extends Equatable {
  const AuthUser({
    required this.id,
    required this.email,
    required this.username,
    this.token,
    this.isEmailVerified = false,
  });

  /// User's unique identifier
  final String id;

  /// User's email address
  final String email;

  /// User's username
  final String username;

  /// Authentication token
  final String? token;

  /// Whether the user's email is verified
  final bool isEmailVerified;

  @override
  List<Object?> get props => [id, email, username, token, isEmailVerified];

  /// Creates a copy of this user with the given fields replaced.
  AuthUser copyWith({
    String? id,
    String? email,
    String? username,
    String? token,
    bool? isEmailVerified,
  }) {
    return AuthUser(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      token: token ?? this.token,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }
}
