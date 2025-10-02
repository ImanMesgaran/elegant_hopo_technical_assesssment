import 'package:equatable/equatable.dart';

import 'package:elegant_hopo_technical_assessment/features/user/domain/entities/user.dart';

/// Event class for the user feature.
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

/// Get all users event
class GetUsersEvent extends UserEvent {
  const GetUsersEvent();
}

/// Get a specific user by ID event
class GetUserEvent extends UserEvent {
  const GetUserEvent(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}

/// Create a new user event
class CreateUserEvent extends UserEvent {
  const CreateUserEvent(this.user);

  final User user;

  @override
  List<Object?> get props => [user];
}

/// Update an existing user event
class UpdateUserEvent extends UserEvent {
  const UpdateUserEvent(this.user);

  final User user;

  @override
  List<Object?> get props => [user];
}

/// Delete a user by ID event
class DeleteUserEvent extends UserEvent {
  const DeleteUserEvent(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}

/// Refresh users list event
class RefreshUsersEvent extends UserEvent {
  const RefreshUsersEvent();
}
