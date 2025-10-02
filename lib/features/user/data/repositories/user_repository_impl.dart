import 'package:dartz/dartz.dart';

import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';
import 'package:elegant_hopo_technical_assessment/core/network/network_info.dart';
import 'package:elegant_hopo_technical_assessment/features/user/data/datasources/user_local_datasource.dart';
import 'package:elegant_hopo_technical_assessment/features/user/data/datasources/user_remote_datasource.dart';
import 'package:elegant_hopo_technical_assessment/features/user/data/models/user_model.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/entities/user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/repositories/user_repository.dart';

/// Implementation of the user repository.
class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, User>> getUser(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.getUser(id);
        await localDataSource.cacheUser(remoteUser);
        return Right(remoteUser.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      try {
        final localUser = await localDataSource.getUser(id);
        if (localUser != null) {
          return Right(localUser.toEntity());
        } else {
          return const Left(CacheFailure(message: 'User not found in cache'));
        }
      } on Exception catch (e) {
        return Left(CacheFailure(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUsers = await remoteDataSource.getUsers();
        await localDataSource.cacheUsers(remoteUsers);
        return Right(remoteUsers.map((user) => user.toEntity()).toList());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      try {
        final localUsers = await localDataSource.getUsers();
        return Right(localUsers.map((user) => user.toEntity()).toList());
      } on Exception catch (e) {
        return Left(CacheFailure(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, User>> createUser(User user) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = UserModel.fromEntity(user);
        final createdUser = await remoteDataSource.createUser(userModel);
        await localDataSource.cacheUser(createdUser);
        return Right(createdUser.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(User user) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = UserModel.fromEntity(user);
        final updatedUser = await remoteDataSource.updateUser(userModel);
        await localDataSource.cacheUser(updatedUser);
        return Right(updatedUser.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteUser(String id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteUser(id);
        await localDataSource.removeUser(id);
        return const Right(unit);
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }
}
