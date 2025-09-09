import 'package:flutter/material.dart';

class AppColors {
  // Primary Brand Colors
  static const Color primary = Color(0xffD7CCC8); // Brown 100
  static const Color darkBrown = Color(0xff4E342E); // Brown 800
  static const Color mediumBrown = Color(0xff6D4C41); // Brown 600
  static const Color lightBrown = Color(0xffA1887F); // Brown 300
  static const Color accent = Color(0xff8D6E63); // Brown 400

  // Background Colors
  static const Color backgroundLight = Color(0xffEFEBE9); // Brown 50
  static const Color backgroundDark = Color(0xff3E2723); // Brown 900

  // Text Colors
  static const Color textPrimary = Color(0xff3E2723); // Dark text
  static const Color textSecondary = Color(0xff5D4037); // Softer dark brown
  static const Color textLight = Color(0xffFFFFFF); // White
  static const Color textHint = Color(0xffBCAAA4); // Light brown/grey

  // Button Gradient
  static const Gradient buttonGradient = LinearGradient(
    colors: [
      Color(0xff6D4C41), // Brown 600
      Color(0xff8D6E63), // Brown 400
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
