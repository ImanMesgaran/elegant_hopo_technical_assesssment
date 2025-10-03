import 'package:elegant_hopo_technical_assessment/features/packages/data/models/beauty_package.dart';
import 'package:elegant_hopo_technical_assessment/features/packages/presentation/widgets/package_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

class PackageListScreen extends StatefulWidget {
  const PackageListScreen({super.key});

  @override
  State<PackageListScreen> createState() => _PackageListScreenState();
}

class _PackageListScreenState extends State<PackageListScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<BeautyPackage> packages = [
    BeautyPackage(
      id: "67",
      title: "Chemical Peel, Oxygen Facial, Skin Tightening",
      progress: 0.45,
      images: [
        "assets/images/images_01.jpg",
        "assets/images/images_02.jpg",
        "assets/images/images_03.jpg",
        "assets/images/images_01.jpg",
        "assets/images/images_02.jpg",
        "assets/images/images_03.jpg",
      ],
      hasExtra: true,
      extraCount: 5,
    ),
    BeautyPackage(
      id: "68",
      title: "Chemical Peel, Oxygen Facial, Skin Tightening",
      progress: 0.35,
      images: [
        "assets/images/images_02.jpg",
        "assets/images/images_03.jpg",
        "assets/images/images_01.jpg",
        "assets/images/images_02.jpg",
        "assets/images/images_03.jpg",
      ],
    ),
    BeautyPackage(
      id: "69",
      title: "Chemical Peel, Oxygen Facial, Skin Tightening",
      progress: 0.35,
      images: [
        "assets/images/images_03.jpg",
        "assets/images/images_01.jpg",
        "assets/images/images_02.jpg",
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Package List',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
            size: 22,
          ),
          onPressed: () => context.go('/'),
        ),
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: packages.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: PackageCard(
                    package: packages[index],
                    onTap: () {
                      context.go('/book-session-screen');
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
