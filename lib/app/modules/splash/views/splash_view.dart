import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              // 🔹 BACKGROUND IMAGE
              Image.asset(
                'assets/images/truck.png',
                fit: BoxFit.cover,
              ),

              // 🔹 BLUR EFFECT
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  color: Colors.blue.withOpacity(0.55),
                ),
              ),

              // 🔹 LOGO (NO WHITE BOX)
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 220,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
