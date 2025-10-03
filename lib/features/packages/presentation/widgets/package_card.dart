import 'package:elegant_hopo_technical_assessment/features/packages/data/models/beauty_package.dart';
import 'package:flutter/material.dart';

class PackageCard extends StatefulWidget {
  final BeautyPackage package;
  final VoidCallback onTap;

  const PackageCard({super.key, required this.package, required this.onTap});

  @override
  State<PackageCard> createState() => _PackageCardState();
}

class _PackageCardState extends State<PackageCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: widget.package.progress,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              _buildImageStack(),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Package#${widget.package.id}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    AnimatedBuilder(
                      animation: _progressAnimation,
                      builder: (context, child) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: _progressAnimation.value,
                            backgroundColor: Colors.grey.shade200,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.orange.shade300,
                            ),
                            minHeight: 8,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.package.title,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageStack() {
    const double imageSize = 50;
    const double overlap = 15;
    const int maxVisibleAvatars = 3;

    // Calculate how many avatars to show and remaining count
    final int visibleCount = widget.package.images.length > maxVisibleAvatars
        ? maxVisibleAvatars
        : widget.package.images.length;
    final int remainingCount = widget.package.images.length - visibleCount;

    // Use consistent maximum width for all rows to ensure column alignment
    // This ensures all columns start at the same position regardless of badge presence
    const double maxConsistentWidth =
        50 + (2 * 15) + 10; // 3 avatars + overlaps + 10px badge extension
    final double consistentWidth = maxConsistentWidth;

    return SizedBox(
      width: consistentWidth,
      height: imageSize,
      child: Stack(
        children: [
          // Show only the first 3 avatars
          ...List.generate(visibleCount, (index) {
            return Positioned(
              left: index * overlap,
              child: Hero(
                tag: 'package_image_${widget.package.id}_$index',
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.0, end: 1.0),
                  duration: Duration(milliseconds: 500 + (index * 200)),
                  curve: Curves.easeOutBack,
                  builder: (context, value, child) {
                    return Transform.scale(scale: value, child: child);
                  },
                  child: Container(
                    width: imageSize,
                    height: imageSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          widget.package.images[index],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),

          // Show +X badge if there are remaining avatars
          if (remainingCount > 0)
            Positioned(
              left:
                  (visibleCount - 1) * overlap +
                  imageSize +
                  10 -
                  40, // Right edge 10px beyond last avatar
              top: (imageSize - 30) / 2, // Center vertically with avatars
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: Duration(milliseconds: 500 + (visibleCount * 200)),
                curve: Curves.easeOutBack,
                builder: (context, value, child) {
                  return Transform.scale(scale: value, child: child);
                },
                child: Container(
                  width: 40, // Shorter width
                  height: 30, // Smaller height than circular avatar
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15,
                    ), // Rounded rectangle
                    color: const Color(0xFFFF6B00), // Orange color
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '+$remainingCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
