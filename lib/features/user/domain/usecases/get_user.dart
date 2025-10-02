import 'package:dartz/dartz.dart';

import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/entities/user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/repositories/user_repository.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/usecase.dart';

/// Use case for getting a user by ID.
class GetUser implements UseCase<User, String> {
  const GetUser(this._repository);

  final UserRepository _repository;

  @override
  Future<Either<Failure, User>> call(String userId) {
    return _repository.getUser(userId);
  }
}
