import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primary = Color(0xFF007AFF);  // iOS blue
  static const Color secondary = Color(0xFF5856D6);  // Deep purple

  // Background colors
  static const Color background = Color(0xFFF2F2F7);  // Light gray background
  static const Color surface = Colors.white;

  // Text colors
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF8E8E93);

  // Accent colors
  static const Color accent = Color(0xFF34C759);  // Green
  static const Color warning = Color(0xFFFF9500);  // Orange
  static const Color error = Color(0xFFFF3B30);  // Red
  static const Color info = Color(0xFF5AC8FA);  // Light blue

  // Additional colors
  static const Color divider = Color(0xFFD1D1D6);
  static const Color disabled = Color(0xFFE5E5EA);

  // On colors
  static const Color onPrimary = Colors.white;
  static const Color onSecondary = Colors.white;
  static const Color onBackground = textPrimary;
  static const Color onSurface = textPrimary;
  static const Color onError = Colors.white;
}