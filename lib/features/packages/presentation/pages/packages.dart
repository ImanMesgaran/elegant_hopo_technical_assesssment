import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PackagesPage extends StatelessWidget {
  const PackagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Package List',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3, // Based on the image showing 3 packages
        itemBuilder: (context, index) {
          return _buildPackageCard(
            context: context,
            packageId: 'Package#${67 + index}',
            progress: 0.65, // Approximately 65% based on the image
            services: 'Chemical Peel, Oxygen Facial, Skin Tightening',
            additionalImages: 5,
          );
        },
      ),
    );
  }

  Widget _buildPackageCard({
    required BuildContext context,
    required String packageId,
    required double progress,
    required String services,
    required int additionalImages,
  }) {
    return GestureDetector(
      onTap: () {
        context.go('/book-session-screen');
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5), // Light gray background
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Left side - Profile images
            _buildProfileImages(additionalImages),
            const SizedBox(width: 16),
            // Right side - Package details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Package title
                  Text(
                    packageId,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Progress bar
                  _buildProgressBar(progress),
                  const SizedBox(height: 8),
                  // Services description
                  Text(
                    services,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ),
            // Navigation arrow
            const Icon(Icons.chevron_right, color: Colors.grey, size: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImages(int additionalImages) {
    return SizedBox(
      width: 80,
      height: 50,
      child: Stack(
        children: [
          // First image (facial treatment)
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(
                Icons.face_retouching_natural,
                color: Colors.grey,
                size: 20,
              ),
            ),
          ),
          // Second image (blonde woman smiling)
          Positioned(
            left: 20,
            top: 0,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(Icons.person, color: Colors.grey, size: 20),
            ),
          ),
          // Third image (blonde woman in outfit)
          Positioned(
            left: 40,
            top: 0,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(
                Icons.person_outline,
                color: Colors.grey,
                size: 20,
              ),
            ),
          ),
          // Additional images badge
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFF6B35), // Orange color
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Center(
                child: Text(
                  '+$additionalImages',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar(double progress) {
    return Container(
      height: 6,
      decoration: BoxDecoration(
        color: Colors.grey[300], // Light gray track
        borderRadius: BorderRadius.circular(3),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFF6B35), // Orange color
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}
