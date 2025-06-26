import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_flutter_weather_app/core/utils/size_utils.dart';

import '../controller/splash_controller.dart';
import '../widgets/custom_image_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  final splashController = Get.put(SplashController()); // Inject controller

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.1),
      end: const Offset(0.0, -0.05),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _fadeAnimation = Tween<double>(
      begin: 0.7,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF3D2C8D),
      body: Container(
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3D2C8D), Color(0xFF9D50BB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: CustomImageView(
                    imagePath: "assets/cloud.png",
                    height: 300.v,
                    width: 300.h,
                  ),
                ),
              ),
              SizedBox(height: 20.v),
              const Text(
                'Weather',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'ForeCasts',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFC727),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
