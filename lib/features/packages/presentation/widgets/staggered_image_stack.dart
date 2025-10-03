import 'package:flutter/material.dart';

class StaggeredImageStack extends StatelessWidget {
  final List<String> images;
  final bool hasExtra;
  final int extraCount;
  final double imageSize;
  final double overlap;

  const StaggeredImageStack({
    super.key,
    required this.images,
    this.hasExtra = false,
    this.extraCount = 0,
    this.imageSize = 50,
    this.overlap = 15,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          imageSize + (images.length - 1) * overlap + (hasExtra ? overlap : 0),
      height: imageSize,
      child: Stack(
        children:
            List.generate(images.length, (index) {
              return Positioned(
                left: index * overlap,
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
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey.shade300,
                          child: const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList()..addAll([
              if (hasExtra)
                Positioned(
                  left: images.length * overlap,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    duration: Duration(
                      milliseconds: 500 + (images.length * 200),
                    ),
                    curve: Curves.easeOutBack,
                    builder: (context, value, child) {
                      return Transform.scale(scale: value, child: child);
                    },
                    child: Container(
                      width: imageSize,
                      height: imageSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange.shade100,
                        border: Border.all(color: Colors.white, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '+$extraCount',
                          style: TextStyle(
                            color: Colors.orange.shade800,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ]),
      ),
    );
  }
}
