import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.teal,
      brightness: Brightness.light,
      primary: AppColors.navy,
      secondary: AppColors.teal,
      surface: AppColors.canvas,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.canvas,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.canvas,
        foregroundColor: AppColors.ink,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        headlineMedium:
            TextStyle(fontWeight: FontWeight.w800, color: AppColors.ink),
        titleLarge:
            TextStyle(fontWeight: FontWeight.w800, color: AppColors.ink),
        titleMedium:
            TextStyle(fontWeight: FontWeight.w700, color: AppColors.ink),
        bodyMedium: TextStyle(color: AppColors.ink),
      ),
    );
  }
}
