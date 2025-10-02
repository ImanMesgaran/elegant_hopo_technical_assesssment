import 'package:dartz/dartz.dart';

import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/entities/user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/repositories/user_repository.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/usecase.dart';

/// Use case for updating an existing user.
class UpdateUser implements UseCase<User, User> {
  const UpdateUser(this._repository);

  final UserRepository _repository;

  @override
  Future<Either<Failure, User>> call(User user) {
    return _repository.updateUser(user);
  }
}
