import 'package:dartz/dartz.dart';

import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/repositories/user_repository.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/usecase.dart';

/// Use case for deleting a user by ID.
class DeleteUser implements UseCase<Unit, String> {
  const DeleteUser(this._repository);

  final UserRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(String userId) {
    return _repository.deleteUser(userId);
  }
}
