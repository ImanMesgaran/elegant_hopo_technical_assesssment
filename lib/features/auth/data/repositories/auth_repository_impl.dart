import 'package:dartz/dartz.dart';

import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';
import 'package:elegant_hopo_technical_assessment/core/network/network_info.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/data/models/auth_user_model.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/entities/auth_user.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/entities/credentials.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/repositories/auth_repository.dart';

/// Implementation of the authentication repository.
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  /// The remote data source.
  final AuthRemoteDataSource remoteDataSource;

  /// The local data source.
  final AuthLocalDataSource localDataSource;

  /// The network info.
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, AuthUser>> signIn(Credentials credentials) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.signIn(credentials);
        await localDataSource.cacheUser(user);
        return Right(user);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, AuthUser>> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.signUp(
          email: email,
          password: password,
          username: username,
        );
        await localDataSource.cacheUser(user);
        return Right(user);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await remoteDataSource.signOut();
      await localDataSource.clearCachedUser();
      return const Right(unit);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthUser?>> getCurrentUser() async {
    try {
      // Try to get from local storage first
      final cachedUser = await localDataSource.getCachedUser();
      if (cachedUser != null) {
        return Right(cachedUser);
      }

      // If not in local storage and we have internet, try to get from remote
      if (await networkInfo.isConnected) {
        final remoteUser = await remoteDataSource.getCurrentUser();
        if (remoteUser != null) {
          await localDataSource.cacheUser(remoteUser);
          return Right(remoteUser);
        }
      }

      // No user found
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendPasswordResetEmail(String email) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.sendPasswordResetEmail(email);
        return const Right(unit);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Unit>> verifyEmail() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.verifyEmail();
        return const Right(unit);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, AuthUser>> updateProfile({
    String? username,
    String? email,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final updatedUser = await remoteDataSource.updateProfile(
          username: username,
          email: email,
        );
        await localDataSource.cacheUser(updatedUser);
        return Right(updatedUser);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Unit>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );
        return const Right(unit);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAccount(String password) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteAccount(password);
        await localDataSource.clearCachedUser();
        return const Right(unit);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }
}
