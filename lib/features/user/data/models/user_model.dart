import 'package:equatable/equatable.dart';

import 'package:elegant_hopo_technical_assessment/features/user/domain/entities/user.dart';

/// Data model for users.
class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String name;
  final String email;
  final String? avatar;
  final String? phoneNumber;
  final DateTime? createdAt;
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

  /// Creates a [UserModel] from JSON.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  /// Creates a [UserModel] from a [User] entity.
  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      avatar: user.avatar,
      phoneNumber: user.phoneNumber,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
  }

  /// Converts this model to JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  /// Converts this model to an entity.
  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
      avatar: avatar,
      phoneNumber: phoneNumber,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Creates a copy of this model with the given fields replaced.
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? avatar,
    String? phoneNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
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
