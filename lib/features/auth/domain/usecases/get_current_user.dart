import 'package:dartz/dartz.dart';

import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/entities/auth_user.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/repositories/auth_repository.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/usecase.dart';

/// Use case for getting the currently authenticated user.
class GetCurrentUser implements UseCase<AuthUser?, NoParams> {
  const GetCurrentUser(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, AuthUser?>> call(NoParams params) {
    return _repository.getCurrentUser();
  }
}
