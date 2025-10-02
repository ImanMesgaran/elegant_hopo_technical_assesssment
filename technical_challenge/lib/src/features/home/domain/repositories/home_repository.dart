import 'package:dartz/dartz.dart';

import '../../../../core/utils/failures.dart';
import '../entities/home_entity.dart';

/// {@template home_repository}
/// Repository interface for home data operations.
/// {@endtemplate}
abstract class HomeRepository {
  /// {@macro home_repository}
  const HomeRepository();

  /// Gets all home items.
  Future<Either<Failure, List<HomeEntity>>> getHomeItems();

  /// Gets a specific home item by ID.
  Future<Either<Failure, HomeEntity>> getHomeItem(String id);

  /// Creates a new home item.
  Future<Either<Failure, HomeEntity>> createHomeItem(HomeEntity item);

  /// Updates an existing home item.
  Future<Either<Failure, HomeEntity>> updateHomeItem(HomeEntity item);

  /// Deletes a home item by ID.
  Future<Either<Failure, void>> deleteHomeItem(String id);
}
