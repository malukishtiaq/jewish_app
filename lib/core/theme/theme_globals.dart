import 'package:flutter/material.dart';

// Simple replacement for the removed alta theme helper
// These are basic color definitions that can be used throughout the app
class AppThemeColors {
  static const Color gray90003 = Color(0xFF1A1A1A);
  static const Color gray900 = Color(0xFF212121);
  static const Color gray40026 = Color(0x42000000);
  static const Color gray40001 = Color(0xFFBDBDBD);
  static const Color gray90002 = Color(0xFF424242);
  static const Color indigo900 = Color(0xFF1A237E);
  static const Color indigo90001 = Color(0xFF283593);
  static const Color lightBlue800 = Color(0xFF1976D2);
  static const Color redA400 = Color(0xFFFF1744);
  static const Color redA700 = Color(0xFFD50000);
  static const Color black9003f = Color(0x3F000000);
}

// Global theme access (simplified version)
ThemeData get theme =>
    ThemeData.light(); // This will be overridden by the actual theme
AppThemeColors get appTheme => AppThemeColors();
