import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SessionHistoryItem extends StatelessWidget {
  final int sessionNumber;
  final String date;
  final bool isCompleted;
  final bool showScheduleButton;

  const SessionHistoryItem({
    super.key,
    required this.sessionNumber,
    required this.date,
    required this.isCompleted,
    this.showScheduleButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: showScheduleButton
            ? Border.all(color: const Color(0xFFFF6B00), width: 1)
            : null,
        borderRadius: showScheduleButton ? BorderRadius.circular(12) : null,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Session $sessionNumber',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          if (showScheduleButton)
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFF0E6),
                foregroundColor: const Color(0xFFFF6B00),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              icon: const Icon(Icons.schedule, size: 18),
              label: const Text('Set a schedule'),
            )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .shimmer(duration: 2000.ms, delay: 1000.ms)
              .then()
              .scale(
                begin: const Offset(1, 1),
                end: const Offset(1.05, 1.05),
                duration: 1000.ms,
              )
              .then()
              .scale(
                begin: const Offset(1.05, 1.05),
                end: const Offset(1, 1),
                duration: 1000.ms,
              ),
          if (isCompleted)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFFF6B00),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              ),
            )
              .animate()
              .scale(
                begin: const Offset(0, 0),
                end: const Offset(1, 1),
                duration: 400.ms,
                curve: Curves.elasticOut,
              ),
        ],
      ),
    );
  }
}
