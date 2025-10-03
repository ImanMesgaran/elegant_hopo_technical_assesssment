import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:elegant_hopo_technical_assessment/features/packages/presentation/pages/packages.dart';
import 'package:elegant_hopo_technical_assessment/features/packages/presentation/pages/book_session_page.dart';
import 'package:elegant_hopo_technical_assessment/features/packages/presentation/pages/package_list_screen.dart';
import 'package:elegant_hopo_technical_assessment/features/splash/presentation/pages/splash_screen.dart';

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
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/packages',
        name: 'packages',
        builder: (context, state) => const PackagesPage(),
      ),
      GoRoute(
        path: '/package-list',
        name: 'package-list',
        builder: (context, state) => const PackageListScreen(),
      ),
      GoRoute(
        path: '/book-session-screen',
        name: 'book-session-screen',
        builder: (context, state) => const BookSessionPage(),
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
