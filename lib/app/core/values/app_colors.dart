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
}
