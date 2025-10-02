import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/entities/auth_user.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/repositories/auth_repository.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/usecase.dart';

/// Parameters for the sign up use case.
class SignUpParams extends Equatable {
  const SignUpParams({
    required this.email,
    required this.password,
    required this.username,
  });

  /// User's email
  final String email;

  /// User's password
  final String password;

  /// User's username
  final String username;

  @override
  List<Object> get props => [email, password, username];
}

/// Use case for signing up a new user.
class SignUp implements UseCase<AuthUser, SignUpParams> {
  const SignUp(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, AuthUser>> call(SignUpParams params) {
    return _repository.signUp(
      email: params.email,
      password: params.password,
      username: params.username,
    );
  }
}
