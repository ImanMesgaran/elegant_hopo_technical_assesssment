import 'package:dartz/dartz.dart';

import '../../../../core/network/network_client.dart';
import '../../../../core/utils/failures.dart';
import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_datasource.dart';
import '../models/home_model.dart';

/// {@template home_repository_impl}
/// Implementation of the home repository.
/// {@endtemplate}
class HomeRepositoryImpl implements HomeRepository {
  /// {@macro home_repository_impl}
  const HomeRepositoryImpl(this._remoteDataSource, this._networkClient);

  final HomeRemoteDataSource _remoteDataSource;
  final NetworkClient _networkClient;

  @override
  Future<Either<Failure, List<HomeEntity>>> getHomeItems() async {
    try {
      final models = await _remoteDataSource.getHomeItems();
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, HomeEntity>> getHomeItem(String id) async {
    try {
      final model = await _remoteDataSource.getHomeItem(id);
      return Right(model.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, HomeEntity>> createHomeItem(HomeEntity item) async {
    try {
      final model = HomeModel.fromEntity(item);
      final createdModel = await _remoteDataSource.createHomeItem(model);
      return Right(createdModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, HomeEntity>> updateHomeItem(HomeEntity item) async {
    try {
      final model = HomeModel.fromEntity(item);
      final updatedModel = await _remoteDataSource.updateHomeItem(model);
      return Right(updatedModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteHomeItem(String id) async {
    try {
      await _remoteDataSource.deleteHomeItem(id);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
