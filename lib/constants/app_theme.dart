import 'package:flutter/material.dart';

class AppColors {
  static const Color indigo = Color(0xFF4C3BCF);
  static const Color indigoLight = Color(0xFF6B5CE7);
  static const Color indigoPale = Color(0xFFEEE9FF);
  static const Color star = Color(0xFFF5A623);
  static const Color background = Color(0xFFF5F6FA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color text = Color(0xFF1A1A2E);
  static const Color muted = Color(0xFF8A8FA8);
  static const Color red = Color(0xFFFF4757);
  static const Color cardShadowColor = Color(0x1A4C3BCF);
}

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.indigo,
        surface: AppColors.white,
      ),
      useMaterial3: true,
    );
  }
}