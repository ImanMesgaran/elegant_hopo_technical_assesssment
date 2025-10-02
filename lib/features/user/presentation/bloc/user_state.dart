import 'package:equatable/equatable.dart';

import 'package:elegant_hopo_technical_assessment/features/user/domain/entities/user.dart';

/// State class for the user feature.
abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class UserInitialState extends UserState {
  const UserInitialState();
}

/// Loading state
class UserLoadingState extends UserState {
  const UserLoadingState();
}

/// Loaded state with users
class UsersLoadedState extends UserState {
  const UsersLoadedState(this.users);

  final List<User> users;

  @override
  List<Object?> get props => [users];
}

/// Loaded state with single user
class UserLoadedState extends UserState {
  const UserLoadedState(this.user);

  final User user;

  @override
  List<Object?> get props => [user];
}

/// Error state
class UserErrorState extends UserState {
  const UserErrorState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
