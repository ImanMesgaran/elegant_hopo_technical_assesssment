import 'package:flutter/material.dart';

import '../../domain/entities/home_entity.dart';

/// {@template home_item_widget}
/// Widget displaying a single home item.
/// {@endtemplate}
class HomeItemWidget extends StatelessWidget {
  /// {@macro home_item_widget}
  const HomeItemWidget({super.key, required this.item, required this.onToggle});

  /// The home item to display.
  final HomeEntity item;

  /// Callback when the item is toggled.
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Checkbox(
          value: item.isCompleted,
          onChanged: (_) => onToggle(),
        ),
        title: Text(
          item.title,
          style: TextStyle(
            decoration: item.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: item.isCompleted ? Theme.of(context).disabledColor : null,
          ),
        ),
        subtitle: Text(
          item.description,
          style: TextStyle(
            decoration: item.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: item.isCompleted ? Theme.of(context).disabledColor : null,
          ),
        ),
        trailing: item.isCompleted
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.radio_button_unchecked, color: Colors.grey),
        onTap: onToggle,
      ),
    );
  }
}
