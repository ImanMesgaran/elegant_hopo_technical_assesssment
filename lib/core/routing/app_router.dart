import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:elegant_hopo_technical_assessment/core/di/injection.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/entities/user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/presentation/bloc/user_bloc.dart';
import 'package:elegant_hopo_technical_assessment/features/user/presentation/bloc/user_event.dart';
import 'package:elegant_hopo_technical_assessment/features/user/presentation/pages/user_list_page.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/presentation/pages/auth_page.dart';
import 'package:elegant_hopo_technical_assessment/main.dart';

/// Application router using GoRouter.
class AppRouter {
  AppRouter();

  /// The router configuration
  late final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/users',
        name: 'users',
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<UserBloc>()..add(const GetUsersEvent()),
          child: const UserListPage(),
        ),
      ),
      GoRoute(
        path: '/auth',
        name: 'auth',
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<AuthBloc>(),
          child: const AuthPage(),
        ),
      ),
      GoRoute(
        path: '/users/:id',
        name: 'user_details',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return BlocProvider(
            create: (context) => getIt<UserBloc>()..add(GetUserEvent(id)),
            child:
                const UserListPage(), // Replace with UserDetailsPage when created
          );
        },
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}

/// Error page shown when route is not found.
class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            const Text(
              'Oops! Page not found.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'The page you are looking for does not exist.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
