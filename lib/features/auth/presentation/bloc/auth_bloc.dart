import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:elegant_hopo_technical_assessment/features/auth/domain/entities/credentials.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/usecases/get_current_user.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/usecases/sign_in.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/usecases/sign_out.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/usecases/sign_up.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/presentation/bloc/auth_event.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/presentation/bloc/auth_state.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/usecase.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.getCurrentUser,
    required this.signIn,
    required this.signUp,
    required this.signOut,
  }) : super(const AuthInitialState()) {
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
    on<SignInEvent>(_onSignIn);
    on<SignUpEvent>(_onSignUp);
    on<SignOutEvent>(_onSignOut);
  }

  /// The use case for getting the current user.
  final GetCurrentUser getCurrentUser;

  /// The use case for signing in.
  final SignIn signIn;

  /// The use case for signing up.
  final SignUp signUp;

  /// The use case for signing out.
  final SignOut signOut;

  Future<void> _onCheckAuthStatus(
    CheckAuthStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoadingState());

    final result = await getCurrentUser(const NoParams());
    result.fold((failure) => emit(AuthErrorState(failure.message)), (user) {
      if (user != null) {
        emit(AuthenticatedState(user));
      } else {
        emit(const UnauthenticatedState());
      }
    });
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoadingState());

    final result = await signIn(event.credentials);
    result.fold(
      (failure) => emit(AuthErrorState(failure.message)),
      (user) => emit(AuthenticatedState(user)),
    );
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoadingState());

    final params = SignUpParams(
      email: event.email,
      password: event.password,
      username: event.username,
    );

    final result = await signUp(params);
    result.fold(
      (failure) => emit(AuthErrorState(failure.message)),
      (user) => emit(AuthenticatedState(user)),
    );
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoadingState());

    final result = await signOut(const NoParams());
    result.fold(
      (failure) => emit(AuthErrorState(failure.message)),
      (_) => emit(const UnauthenticatedState()),
    );
  }
}
