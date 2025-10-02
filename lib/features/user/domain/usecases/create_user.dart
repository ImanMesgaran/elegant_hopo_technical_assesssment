import 'package:dartz/dartz.dart';

import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/entities/user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/repositories/user_repository.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/usecase.dart';

/// Use case for creating a new user.
class CreateUser implements UseCase<User, User> {
  const CreateUser(this._repository);

  final UserRepository _repository;

  @override
  Future<Either<Failure, User>> call(User user) {
    return _repository.createUser(user);
  }
}
