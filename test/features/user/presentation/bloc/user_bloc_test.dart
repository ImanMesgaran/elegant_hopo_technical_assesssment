import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/entities/user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/create_user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/delete_user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/get_user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/get_users.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/update_user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/usecase.dart';
import 'package:elegant_hopo_technical_assessment/features/user/presentation/bloc/user_bloc.dart';
import 'package:elegant_hopo_technical_assessment/features/user/presentation/bloc/user_event.dart';
import 'package:elegant_hopo_technical_assessment/features/user/presentation/bloc/user_state.dart';

class MockGetUsers extends Mock implements GetUsers {}

class MockGetUser extends Mock implements GetUser {}

class MockCreateUser extends Mock implements CreateUser {}

class MockUpdateUser extends Mock implements UpdateUser {}

class MockDeleteUser extends Mock implements DeleteUser {}

void main() {
  late UserBloc userBloc;
  late MockGetUsers mockGetUsers;
  late MockGetUser mockGetUser;
  late MockCreateUser mockCreateUser;
  late MockUpdateUser mockUpdateUser;
  late MockDeleteUser mockDeleteUser;

  setUp(() {
    mockGetUsers = MockGetUsers();
    mockGetUser = MockGetUser();
    mockCreateUser = MockCreateUser();
    mockUpdateUser = MockUpdateUser();
    mockDeleteUser = MockDeleteUser();

    userBloc = UserBloc(
      getUsers: mockGetUsers,
      getUser: mockGetUser,
      createUser: mockCreateUser,
      updateUser: mockUpdateUser,
      deleteUser: mockDeleteUser,
    );
  });

  tearDown(() {
    userBloc.close();
  });

  const testUser = User(
    id: '1',
    name: 'John Doe',
    email: 'john.doe@example.com',
  );

  group('UserBloc', () {
    test('initial state should be UserInitialState', () {
      expect(userBloc.state, const UserInitialState());
    });

    blocTest<UserBloc, UserState>(
      'emits [UserLoadingState, UsersLoadedState] when GetUsersEvent is added and successful',
      build: () {
        when(
          () => mockGetUsers(const NoParams()),
        ).thenAnswer((_) async => const Right([testUser]));
        return userBloc;
      },
      act: (bloc) => bloc.add(const GetUsersEvent()),
      expect: () => [
        const UserLoadingState(),
        const UsersLoadedState([testUser]),
      ],
      verify: (_) {
        verify(() => mockGetUsers(const NoParams())).called(1);
      },
    );

    blocTest<UserBloc, UserState>(
      'emits [UserLoadingState, UserErrorState] when GetUsersEvent is added and fails',
      build: () {
        when(
          () => mockGetUsers(const NoParams()),
        ).thenAnswer((_) async => const Left(ServerFailure()));
        return userBloc;
      },
      act: (bloc) => bloc.add(const GetUsersEvent()),
      expect: () => [
        const UserLoadingState(),
        const UserErrorState('Server error occurred'),
      ],
      verify: (_) {
        verify(() => mockGetUsers(const NoParams())).called(1);
      },
    );

    blocTest<UserBloc, UserState>(
      'emits [UserLoadingState, UserLoadedState] when GetUserEvent is added and successful',
      build: () {
        when(
          () => mockGetUser('1'),
        ).thenAnswer((_) async => const Right(testUser));
        return userBloc;
      },
      act: (bloc) => bloc.add(const GetUserEvent('1')),
      expect: () => [const UserLoadingState(), const UserLoadedState(testUser)],
      verify: (_) {
        verify(() => mockGetUser('1')).called(1);
      },
    );
  });
}
