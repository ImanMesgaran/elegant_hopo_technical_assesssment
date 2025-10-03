import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProgressSummary extends StatelessWidget {
  final String title;
  final int completedSessions;
  final int totalSessions;
  final int remainingSessions;

  const ProgressSummary({
    super.key,
    required this.title,
    required this.completedSessions,
    required this.totalSessions,
    required this.remainingSessions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0E6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Stack(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    value: completedSessions / totalSessions,
                    strokeWidth: 8,
                    backgroundColor: Colors.white,
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF6B00)),
                  ),
                )
                  .animate()
                  .custom(
                    duration: 1500.ms,
                    builder: (context, value, child) {
                      return CircularProgressIndicator(
                        value: value * completedSessions / totalSessions,
                        strokeWidth: 8,
                        backgroundColor: Colors.white,
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF6B00)),
                      );
                    },
                  ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$remainingSessions',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF6B00),
                        ),
                      ),
                      const Text(
                        'Left',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFFF6B00),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF6B00),
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF333333),
                    ),
                    children: [
                      const TextSpan(text: 'You\'ve completed '),
                      TextSpan(
                        text: '$completedSessions sessions',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF6B00),
                        ),
                      ),
                      const TextSpan(text: ' — only '),
                      TextSpan(
                        text: '$remainingSessions sessions left to go!',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF6B00),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFFDDC7),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              '$completedSessions/$totalSessions Done',
              style: const TextStyle(
                color: Color(0xFFFF6B00),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    )
      .animate(onPlay: (controller) => controller.repeat(reverse: true))
      .shimmer(duration: 2000.ms, delay: 2000.ms);
  }
}
