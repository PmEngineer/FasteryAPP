import 'package:flutter/material.dart';

// Abstract class to hold all application color constants.
abstract class AppColors {
  // --- Primary Theme Colors ---

  /// Primary Red/Pink color from the UI image: #F53B57
  static const Color primaryRed = Color(0xFFF53B57);

  static const Color primaryPurple = Colors.purple;

  /// A slightly darker shade for primary actions or shadows.
  static const Color primaryDark = Color(0xFFE0354E);

  // --- Utility & Status Colors ---

  /// Color used for the 'GET OTP' button when disabled.
  static Color disabledButton = Colors.grey.shade400;

  /// Background color for the Scaffold (usually white or near-white).
  static const Color background = Colors.white;

  /// Main text color (usually black or dark grey).
  static const Color textDark = Color(0xFF1E1E1E);

  /// Secondary text color for instructions or hints.
  static const Color textGrey = Color(0xFF757575);

  /// Color used for inactive indicators (like the grey hearts in the UI).
  static Color inactiveIndicator = Colors.grey.shade300;

  // --- General UI Colors ---

  /// Standard light grey for borders or separators.
  static Color lightGrey = Colors.grey.shade200;
}