import 'package:elegant_hopo_technical_assessment/features/auth/domain/entities/auth_user.dart';

/// Data model for authenticated user.
class AuthUserModel extends AuthUser {
  const AuthUserModel({
    required super.id,
    required super.email,
    required super.username,
    super.token,
    super.isEmailVerified = false,
  });

  /// Creates an [AuthUserModel] from JSON.
  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      token: json['token'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
    );
  }

  /// Creates an [AuthUserModel] from an [AuthUser] entity.
  factory AuthUserModel.fromEntity(AuthUser user) {
    return AuthUserModel(
      id: user.id,
      email: user.email,
      username: user.username,
      token: user.token,
      isEmailVerified: user.isEmailVerified,
    );
  }

  /// Converts this model to JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'token': token,
      'isEmailVerified': isEmailVerified,
    };
  }

  /// Creates a copy of this model with the given fields replaced.
  @override
  AuthUserModel copyWith({
    String? id,
    String? email,
    String? username,
    String? token,
    bool? isEmailVerified,
  }) {
    return AuthUserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      token: token ?? this.token,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }
}
