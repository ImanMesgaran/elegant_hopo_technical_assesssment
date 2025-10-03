import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NoteSection extends StatelessWidget {
  final String note;

  const NoteSection({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF0E6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.add,
                color: Color(0xFFFF6B00),
                size: 16,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Note',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: Color(0xFFFF6B00),
                size: 18,
              ),
              label: const Text(
                'Edit',
                style: TextStyle(
                  color: Color(0xFFFF6B00),
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .shimmer(duration: 2000.ms, delay: 1000.ms),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            note,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
        )
          .animate()
          .fadeIn(duration: 800.ms)
          .slideY(begin: 0.1, end: 0, duration: 800.ms, curve: Curves.easeOutQuad),
      ],
    );
  }
}
