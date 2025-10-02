import 'package:flutter/material.dart';

import 'package:elegant_hopo_technical_assessment/core/utils/validators.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/entities/credentials.dart';

/// Form for authentication (sign in or sign up).
class AuthForm extends StatefulWidget {
  const AuthForm({
    required this.isSignIn,
    required this.onSubmit,
    required this.onToggleMode,
    this.isLoading = false,
    super.key,
  });

  /// Whether this form is for sign in (true) or sign up (false).
  final bool isSignIn;

  /// Callback when the form is submitted.
  final void Function({
    required String email,
    required String password,
    String? username,
  })
  onSubmit;

  /// Callback to toggle between sign in and sign up modes.
  final VoidCallback onToggleMode;

  /// Whether the form is in a loading state.
  final bool isLoading;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onSubmit(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        username: widget.isSignIn ? null : _usernameController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!widget.isSignIn) ...[
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
              ),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a username';
                }
                if (value.trim().length < 3) {
                  return 'Username must be at least 3 characters';
                }
                return null;
              },
              enabled: !widget.isLoading,
            ),
            const SizedBox(height: 16),
          ],
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your email';
              }
              if (!Validators.isValidEmail(value.trim())) {
                return 'Please enter a valid email';
              }
              return null;
            },
            enabled: !widget.isLoading,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            obscureText: _obscurePassword,
            textInputAction: widget.isSignIn
                ? TextInputAction.done
                : TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your password';
              }
              if (!widget.isSignIn &&
                  !Validators.isValidPassword(value.trim())) {
                return 'Password must be at least 8 characters and include uppercase, lowercase, and numbers';
              }
              return null;
            },
            enabled: !widget.isLoading,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: widget.isLoading ? null : _submit,
              child: widget.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(widget.isSignIn ? 'Sign In' : 'Sign Up'),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: widget.isLoading ? null : widget.onToggleMode,
            child: Text(
              widget.isSignIn
                  ? 'Don\'t have an account? Sign Up'
                  : 'Already have an account? Sign In',
            ),
          ),
          if (widget.isSignIn) ...[
            TextButton(
              onPressed: widget.isLoading
                  ? null
                  : () {
                      // TODO(dev): Implement forgot password
                    },
              child: const Text('Forgot Password?'),
            ),
          ],
        ],
      ),
    );
  }
}
