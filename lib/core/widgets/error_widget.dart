import 'package:flutter/material.dart';

import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';

/// A reusable error widget with customizable message and retry functionality.
class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
    required this.failure,
    this.onRetry,
    this.icon = Icons.error_outline,
  });

  /// The failure that caused the error
  final Failure failure;

  /// Callback when retry is pressed
  final VoidCallback? onRetry;

  /// Icon to display
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: Theme.of(context).colorScheme.error),
            const SizedBox(height: 16),
            Text(
              failure.message,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            if (failure.code != null) ...[
              const SizedBox(height: 8),
              Text(
                'Error Code: ${failure.code}',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
