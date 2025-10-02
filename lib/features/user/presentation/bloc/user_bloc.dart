import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/create_user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/delete_user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/get_user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/get_users.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/update_user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/usecase.dart';
import 'package:elegant_hopo_technical_assessment/features/user/presentation/bloc/user_event.dart';
import 'package:elegant_hopo_technical_assessment/features/user/presentation/bloc/user_state.dart';

/// BLoC for managing user state and events.
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required this.getUsers,
    required this.getUser,
    required this.createUser,
    required this.updateUser,
    required this.deleteUser,
  }) : super(const UserInitialState()) {
    on<GetUsersEvent>(_onGetUsers);
    on<GetUserEvent>(_onGetUser);
    on<CreateUserEvent>(_onCreateUser);
    on<UpdateUserEvent>(_onUpdateUser);
    on<DeleteUserEvent>(_onDeleteUser);
    on<RefreshUsersEvent>(_onRefreshUsers);
  }

  final GetUsers getUsers;
  final GetUser getUser;
  final CreateUser createUser;
  final UpdateUser updateUser;
  final DeleteUser deleteUser;

  Future<void> _onGetUsers(GetUsersEvent event, Emitter<UserState> emit) async {
    emit(const UserLoadingState());

    final result = await getUsers(const NoParams());
    result.fold(
      (failure) => emit(UserErrorState(failure.message)),
      (users) => emit(UsersLoadedState(users)),
    );
  }

  Future<void> _onGetUser(GetUserEvent event, Emitter<UserState> emit) async {
    emit(const UserLoadingState());

    final result = await getUser(event.id);
    result.fold(
      (failure) => emit(UserErrorState(failure.message)),
      (user) => emit(UserLoadedState(user)),
    );
  }

  Future<void> _onCreateUser(
    CreateUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoadingState());

    final result = await createUser(event.user);
    result.fold((failure) => emit(UserErrorState(failure.message)), (user) {
      // Add the new user to the current list if we have one
      if (state is UsersLoadedState) {
        final currentUsers = (state as UsersLoadedState).users;
        emit(UsersLoadedState([...currentUsers, user]));
      } else {
        emit(UserLoadedState(user));
      }
    });
  }

  Future<void> _onUpdateUser(
    UpdateUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoadingState());

    final result = await updateUser(event.user);
    result.fold((failure) => emit(UserErrorState(failure.message)), (
      updatedUser,
    ) {
      // Update the user in the current list if we have one
      if (state is UsersLoadedState) {
        final currentUsers = (state as UsersLoadedState).users;
        final updatedUsers = currentUsers
            .map((user) => user.id == updatedUser.id ? updatedUser : user)
            .toList();
        emit(UsersLoadedState(updatedUsers));
      } else {
        emit(UserLoadedState(updatedUser));
      }
    });
  }

  Future<void> _onDeleteUser(
    DeleteUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoadingState());

    final result = await deleteUser(event.id);
    result.fold((failure) => emit(UserErrorState(failure.message)), (_) {
      // Remove the user from the current list if we have one
      if (state is UsersLoadedState) {
        final currentUsers = (state as UsersLoadedState).users;
        final updatedUsers = currentUsers
            .where((user) => user.id != event.id)
            .toList();
        emit(UsersLoadedState(updatedUsers));
      }
    });
  }

  Future<void> _onRefreshUsers(
    RefreshUsersEvent event,
    Emitter<UserState> emit,
  ) async {
    add(const GetUsersEvent());
  }
}
