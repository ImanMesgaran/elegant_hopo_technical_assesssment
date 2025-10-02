import 'package:dartz/dartz.dart';

import '../../../../core/utils/failures.dart';
import '../entities/home_entity.dart';
import '../repositories/home_repository.dart';

/// {@template get_home_items}
/// Use case for getting all home items.
/// {@endtemplate}
class GetHomeItems {
  /// {@macro get_home_items}
  const GetHomeItems(this._repository);

  final HomeRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, List<HomeEntity>>> call() async {
    return _repository.getHomeItems();
  }
}
