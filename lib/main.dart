import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:elegant_hopo_technical_assessment/core/di/injection.dart';
import 'package:elegant_hopo_technical_assessment/core/routing/app_router.dart';

/// Entry point of the application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies
  await configureDependencies();

  runApp(const ElegantHopoApp());
}

/// Root widget of the application.
class ElegantHopoApp extends StatelessWidget {
  const ElegantHopoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      title: 'Elegant Hopo Technical Assessment',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.router,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
    );
  }
}

/// Simple home page demonstrating the architecture.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elegant Hopo Technical Assessment'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.architecture, size: 100, color: Colors.blue),
            const SizedBox(height: 24),
            const Text(
              'Clean Architecture Flutter App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Built with Clean Architecture principles',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              'Feature-first organization',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              'BLoC state management',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              'Dartz error handling',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => GoRouter.of(context).go('/users'),
              icon: const Icon(Icons.people),
              label: const Text('User Management'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => GoRouter.of(context).go('/auth'),
              icon: const Icon(Icons.login),
              label: const Text('Authentication'),
            ),
          ],
        ),
      ),
    );
  }
}
