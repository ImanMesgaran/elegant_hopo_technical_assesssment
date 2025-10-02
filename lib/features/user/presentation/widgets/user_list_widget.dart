import 'package:flutter/material.dart';

import 'package:elegant_hopo_technical_assessment/features/user/domain/entities/user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/presentation/widgets/user_card_widget.dart';

/// Widget displaying a list of users.
class UserListWidget extends StatelessWidget {
  const UserListWidget({required this.users, super.key});

  /// List of users to display
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people_outline, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No users found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return UserCardWidget(
          user: user,
          onTap: () {
            // TODO(dev): Navigate to user details page
          },
          onEdit: () {
            // TODO(dev): Navigate to edit user page
          },
          onDelete: () {
            // TODO(dev): Show delete confirmation dialog
          },
        );
      },
    );
  }
}
