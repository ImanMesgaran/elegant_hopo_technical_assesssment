import 'package:flutter/material.dart';

import 'package:elegant_hopo_technical_assessment/features/user/domain/entities/user.dart';

/// Widget displaying a single user card.
class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    required this.user,
    this.onTap,
    this.onEdit,
    this.onDelete,
    super.key,
  });

  /// The user to display
  final User user;

  /// Callback when the card is tapped
  final VoidCallback? onTap;

  /// Callback when edit is pressed
  final VoidCallback? onEdit;

  /// Callback when delete is pressed
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: user.avatar != null
              ? NetworkImage(user.avatar!)
              : null,
          child: user.avatar == null
              ? Text(user.name.isNotEmpty ? user.name[0].toUpperCase() : '?')
              : null,
        ),
        title: Text(
          user.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.email),
            if (user.phoneNumber != null)
              Text(
                user.phoneNumber!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'edit':
                onEdit?.call();
              case 'delete':
                onDelete?.call();
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [Icon(Icons.edit), SizedBox(width: 8), Text('Edit')],
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Delete', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
