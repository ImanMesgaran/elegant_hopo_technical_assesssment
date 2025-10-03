import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TreatmentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String category;
  final String imagePath;

  const TreatmentCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 120,
                height: 100,
                color: Colors.orange.shade100,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.orange.shade200,
                      child: const Icon(
                        Icons.spa,
                        size: 40,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .shimmer(duration: 2000.ms, delay: 500.ms),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF0E6),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Color(0xFFFF6B00),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                    .animate(onPlay: (controller) => controller.repeat(reverse: true))
                    .shimmer(duration: 2000.ms, delay: 1500.ms),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
