import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const FleetCareApp());
}

class FleetCareApp extends StatelessWidget {
  const FleetCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FleetCare ELD',
      home: SplashScreen(),
    );
  }
}
