import 'package:equatable/equatable.dart';

/// User entity representing a user in the domain layer.
class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
  });

  /// Unique identifier for the user.
  final String id;

  /// User's full name.
  final String name;

  /// User's email address.
  final String email;

  /// User's avatar URL.
  final String? avatar;

  /// User's phone number.
  final String? phoneNumber;

  /// When the user was created.
  final DateTime? createdAt;

  /// When the user was last updated.
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    avatar,
    phoneNumber,
    createdAt,
    updatedAt,
  ];

  /// Creates a copy of this user with the given fields replaced.
  User copyWith({
    String? id,
    String? name,
    String? email,
    String? avatar,
    String? phoneNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
