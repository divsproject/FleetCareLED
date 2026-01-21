import 'dart:ui';
import 'package:flutter/material.dart';
import '../auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
