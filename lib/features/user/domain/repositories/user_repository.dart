import 'package:dartz/dartz.dart';

import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/entities/user.dart';

/// Repository interface for user data operations.
abstract class UserRepository {
  const UserRepository();

  /// Gets a user by ID.
  Future<Either<Failure, User>> getUser(String id);

  /// Gets all users.
  Future<Either<Failure, List<User>>> getUsers();

  /// Creates a new user.
  Future<Either<Failure, User>> createUser(User user);

  /// Updates an existing user.
  Future<Either<Failure, User>> updateUser(User user);

  /// Deletes a user by ID.
  Future<Either<Failure, Unit>> deleteUser(String id);
}
