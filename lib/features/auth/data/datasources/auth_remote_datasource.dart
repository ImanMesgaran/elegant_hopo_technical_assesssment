import 'dart:convert';

import 'package:elegant_hopo_technical_assessment/core/network/network_client.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/data/models/auth_user_model.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/entities/credentials.dart';

/// Remote data source for authentication operations.
abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();

  /// Signs in a user with email and password.
  Future<AuthUserModel> signIn(Credentials credentials);

  /// Signs up a new user with email and password.
  Future<AuthUserModel> signUp({
    required String email,
    required String password,
    required String username,
  });

  /// Signs out the current user.
  Future<void> signOut();

  /// Gets the currently authenticated user.
  Future<AuthUserModel?> getCurrentUser();

  /// Sends a password reset email.
  Future<void> sendPasswordResetEmail(String email);

  /// Verifies the user's email.
  Future<void> verifyEmail();

  /// Updates the user's profile.
  Future<AuthUserModel> updateProfile({String? username, String? email});

  /// Changes the user's password.
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  /// Deletes the user's account.
  Future<void> deleteAccount(String password);
}

/// Implementation of the remote data source for authentication.
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl({required this.networkClient});

  /// The network client for making HTTP requests.
  final NetworkClient networkClient;

  @override
  Future<AuthUserModel> signIn(Credentials credentials) async {
    // This is a mock implementation
    await Future<void>.delayed(const Duration(seconds: 1));

    // Simulate authentication
    if (credentials.email == 'test@example.com' &&
        credentials.password == 'password123') {
      return const AuthUserModel(
        id: '1',
        email: 'test@example.com',
        username: 'testuser',
        token: 'mock_token_12345',
        isEmailVerified: true,
      );
    } else {
      throw Exception('Invalid credentials');
    }
  }

  @override
  Future<AuthUserModel> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    // This is a mock implementation
    await Future<void>.delayed(const Duration(seconds: 1));

    return AuthUserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      username: username,
      token: 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
      isEmailVerified: false,
    );
  }

  @override
  Future<void> signOut() async {
    // This is a mock implementation
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return;
  }

  @override
  Future<AuthUserModel?> getCurrentUser() async {
    // This is a mock implementation
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // Simulate returning a cached user
    return const AuthUserModel(
      id: '1',
      email: 'test@example.com',
      username: 'testuser',
      token: 'mock_token_12345',
      isEmailVerified: true,
    );
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    // This is a mock implementation
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return;
  }

  @override
  Future<void> verifyEmail() async {
    // This is a mock implementation
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return;
  }

  @override
  Future<AuthUserModel> updateProfile({String? username, String? email}) async {
    // This is a mock implementation
    await Future<void>.delayed(const Duration(milliseconds: 500));

    return const AuthUserModel(
      id: '1',
      email: 'updated@example.com',
      username: 'updateduser',
      token: 'mock_token_12345',
      isEmailVerified: true,
    );
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    // This is a mock implementation
    await Future<void>.delayed(const Duration(milliseconds: 500));

    if (currentPassword != 'password123') {
      throw Exception('Current password is incorrect');
    }

    return;
  }

  @override
  Future<void> deleteAccount(String password) async {
    // This is a mock implementation
    await Future<void>.delayed(const Duration(milliseconds: 500));

    if (password != 'password123') {
      throw Exception('Password is incorrect');
    }

    return;
  }
}
