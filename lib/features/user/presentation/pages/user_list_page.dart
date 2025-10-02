import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:elegant_hopo_technical_assessment/core/widgets/error_widget.dart'
    as app_error;
import 'package:elegant_hopo_technical_assessment/core/widgets/loading_widget.dart';
import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';
import 'package:elegant_hopo_technical_assessment/features/user/presentation/bloc/user_bloc.dart';
import 'package:elegant_hopo_technical_assessment/features/user/presentation/bloc/user_event.dart';
import 'package:elegant_hopo_technical_assessment/features/user/presentation/bloc/user_state.dart';
import 'package:elegant_hopo_technical_assessment/features/user/presentation/widgets/user_list_widget.dart';

/// Page displaying a list of users.
class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<UserBloc>().add(const RefreshUsersEvent());
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitialState || state is UserLoadingState) {
            return const LoadingWidget();
          } else if (state is UsersLoadedState) {
            return UserListWidget(users: state.users);
          } else if (state is UserLoadedState) {
            return UserListWidget(users: [state.user]);
          } else if (state is UserErrorState) {
            return app_error.ErrorWidget(
              failure: ServerFailure(message: state.message),
              onRetry: () {
                context.read<UserBloc>().add(const GetUsersEvent());
              },
            );
          }
          return const LoadingWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO(dev): Navigate to create user page
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
