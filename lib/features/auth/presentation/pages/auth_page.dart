import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:elegant_hopo_technical_assessment/features/auth/domain/entities/credentials.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/presentation/bloc/auth_event.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/presentation/bloc/auth_state.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/presentation/widgets/auth_form.dart';

/// Page for authentication (sign in or sign up).
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isSignIn = true;

  void _toggleMode() {
    setState(() {
      _isSignIn = !_isSignIn;
    });
  }

  void _handleSubmit({
    required String email,
    required String password,
    String? username,
  }) {
    if (_isSignIn) {
      context.read<AuthBloc>().add(
        SignInEvent(Credentials(email: email, password: password)),
      );
    } else {
      context.read<AuthBloc>().add(
        SignUpEvent(email: email, password: password, username: username!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isSignIn ? 'Sign In' : 'Sign Up'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is AuthenticatedState) {
            context.go('/users');
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 24),
                Icon(
                  Icons.lock,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 24),
                Text(
                  _isSignIn ? 'Welcome Back' : 'Create Account',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  _isSignIn ? 'Sign in to continue' : 'Sign up to get started',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 32),
                AuthForm(
                  isSignIn: _isSignIn,
                  onSubmit: _handleSubmit,
                  onToggleMode: _toggleMode,
                  isLoading: state is AuthLoadingState,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
