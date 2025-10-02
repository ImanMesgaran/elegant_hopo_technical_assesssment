import 'package:dartz/dartz.dart';

import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/entities/user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/repositories/user_repository.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/usecase.dart';

/// Use case for getting all users.
class GetUsers implements UseCase<List<User>, NoParams> {
  const GetUsers(this._repository);

  final UserRepository _repository;

  @override
  Future<Either<Failure, List<User>>> call(NoParams params) {
    return _repository.getUsers();
  }
}
