import 'package:flutter/material.dart';

/// A reusable loading widget with customizable message.
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.message = 'Loading...',
    this.size = 24.0,
  });

  /// Loading message to display
  final String message;

  /// Size of the loading indicator
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: const CircularProgressIndicator(),
          ),
          const SizedBox(height: 16),
          Text(message, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
