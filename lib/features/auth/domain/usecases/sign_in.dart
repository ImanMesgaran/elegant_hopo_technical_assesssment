import 'package:dartz/dartz.dart';

import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/entities/auth_user.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/entities/credentials.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/repositories/auth_repository.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/usecase.dart';

/// Use case for signing in a user.
class SignIn implements UseCase<AuthUser, Credentials> {
  const SignIn(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, AuthUser>> call(Credentials credentials) {
    return _repository.signIn(credentials);
  }
}
