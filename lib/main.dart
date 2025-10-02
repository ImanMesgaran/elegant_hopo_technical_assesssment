import 'package:flutter/material.dart';

import 'package:technical_challenge/src/core/constants/app_constants.dart';
import 'package:technical_challenge/src/core/di/injection.dart';
import 'package:technical_challenge/src/core/theme/app_theme.dart';
import 'package:technical_challenge/src/features/home/presentation/pages/home_page.dart';

/// {@template main}
/// Entry point of the application.
/// {@endtemplate}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure dependency injection
  await configureDependencies();

  runApp(const TechnicalChallengeApp());
}

/// {@template technical_challenge_app}
/// Root widget of the application.
/// {@endtemplate}
class TechnicalChallengeApp extends StatelessWidget {
  /// {@macro technical_challenge_app}
  const TechnicalChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
