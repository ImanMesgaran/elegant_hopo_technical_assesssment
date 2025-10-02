import 'package:dartz/dartz.dart';

import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/entities/auth_user.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/entities/credentials.dart';

/// Repository interface for authentication operations.
abstract class AuthRepository {
  const AuthRepository();

  /// Signs in a user with email and password.
  Future<Either<Failure, AuthUser>> signIn(Credentials credentials);

  /// Signs up a new user with email and password.
  Future<Either<Failure, AuthUser>> signUp({
    required String email,
    required String password,
    required String username,
  });

  /// Signs out the current user.
  Future<Either<Failure, Unit>> signOut();

  /// Gets the currently authenticated user.
  Future<Either<Failure, AuthUser?>> getCurrentUser();

  /// Sends a password reset email.
  Future<Either<Failure, Unit>> sendPasswordResetEmail(String email);

  /// Verifies the user's email.
  Future<Either<Failure, Unit>> verifyEmail();

  /// Updates the user's profile.
  Future<Either<Failure, AuthUser>> updateProfile({
    String? username,
    String? email,
  });

  /// Changes the user's password.
  Future<Either<Failure, Unit>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  /// Deletes the user's account.
  Future<Either<Failure, Unit>> deleteAccount(String password);
}
