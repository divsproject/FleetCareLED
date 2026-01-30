import 'package:flutter/material.dart';

/// App-wide color constants
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // Primary Colors
  static const Color primary = Color(0xFF2AA6DF);
  static const Color primaryDark = Color(0xFF1E8BC3);
  static const Color primaryLight = Color(0xFF5BC0E8);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Background Colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFEFF7FC);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFAAAAAA);
  static const Color textInverse = Color(0xFFFFFFFF);

  // Input Field Colors
  static const Color inputFill = Color(0xFFF2F2F2);
  static const Color inputBorder = Color(0xFFE0E0E0);
  static const Color inputFocus = primary;
  static const Color inputError = Color(0xFFFF4D4F);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF2196F3);

  // Specific UI Colors
  static const Color lightBlueBg = Color(0xFFEAF6FF);
  static const Color lightGreenBg = Color(0xFFF2FBF6);
  static const Color lightGreenIconBg = Color(0xFFE0F2E9);
  static const Color redLight =
      Color(0xFFFFEBEE); // approximate for Colors.red.withOpacity(0.1)
  static const Color scaffoldBackground = Color(0xFFF4F9FD);
}
