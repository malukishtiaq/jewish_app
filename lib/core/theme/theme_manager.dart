import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jewish_app/core/theme/app_theme.dart';

/// Theme manager for handling theme switching and persistence
class ThemeManager extends ChangeNotifier {
  static const String _themeKey = 'app_theme_mode';

  ThemeMode _themeMode = ThemeMode.light;
  bool _isDarkMode = false;

  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _isDarkMode;
  bool get isLightMode => !_isDarkMode;

  /// Get the appropriate theme data based on current mode
  ThemeData get currentTheme {
    return _isDarkMode ? AppTheme.darkThemeData : AppTheme.lightThemeData;
  }

  /// Initialize theme from shared preferences
  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final savedThemeMode = prefs.getString(_themeKey);

    if (savedThemeMode != null) {
      _themeMode = ThemeMode.values.firstWhere(
        (mode) => mode.toString() == savedThemeMode,
        orElse: () => ThemeMode.light,
      );
    }

    _updateDarkModeState();
    notifyListeners();
  }

  /// Set theme mode and persist to preferences
  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;

    _themeMode = mode;
    _updateDarkModeState();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, mode.toString());

    notifyListeners();
  }

  /// Toggle between light and dark themes
  Future<void> toggleTheme() async {
    final newMode = _isDarkMode ? ThemeMode.light : ThemeMode.dark;
    await setThemeMode(newMode);
  }

  /// Set light theme
  Future<void> setLightTheme() async {
    await setThemeMode(ThemeMode.light);
  }

  /// Set dark theme
  Future<void> setDarkTheme() async {
    await setThemeMode(ThemeMode.dark);
  }

  /// Set system theme (follows device settings)
  Future<void> setSystemTheme() async {
    await setThemeMode(ThemeMode.system);
  }

  void _updateDarkModeState() {
    switch (_themeMode) {
      case ThemeMode.light:
        _isDarkMode = false;
        break;
      case ThemeMode.dark:
        _isDarkMode = true;
        break;
      case ThemeMode.system:
        // For system mode, we'll need to check the actual brightness
        // This will be handled by the MaterialApp
        _isDarkMode = false; // Default fallback
        break;
    }
  }

  /// Update dark mode state based on system brightness for system theme mode
  void updateSystemBrightness(Brightness brightness) {
    if (_themeMode == ThemeMode.system) {
      final newIsDarkMode = brightness == Brightness.dark;
      if (_isDarkMode != newIsDarkMode) {
        _isDarkMode = newIsDarkMode;
        notifyListeners();
      }
    }
  }
}

/// Theme-related extensions for easy access
extension ThemeExtensions on BuildContext {
  /// Get the current color scheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Get the current text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Check if dark mode is active
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Check if light mode is active
  bool get isLightMode => !isDarkMode;

  /// Get primary color
  Color get primaryColor => colorScheme.primary;

  /// Get secondary color
  Color get secondaryColor => colorScheme.secondary;

  /// Get surface color
  Color get surfaceColor => colorScheme.surface;

  /// Get background color
  Color get backgroundColor => colorScheme.background;

  /// Get error color
  Color get errorColor => colorScheme.error;
}

/// Predefined gradients for the app
class AppGradients {
  AppGradients._();

  /// Primary gradient using theme colors
  static LinearGradient primary(BuildContext context) {
    final colorScheme = context.colorScheme;
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [colorScheme.primary, colorScheme.primaryContainer],
    );
  }

  /// Secondary gradient using theme colors
  static LinearGradient secondary(BuildContext context) {
    final colorScheme = context.colorScheme;
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [colorScheme.secondary, colorScheme.secondaryContainer],
    );
  }

  /// Purple gradient (matching your current design)
  static const LinearGradient purple = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0x008147BB), Color(0xFF8147BB)],
    stops: [0.2667, 0.5627],
  );

  /// Surface gradient for dark mode
  static LinearGradient surface(BuildContext context) {
    final colorScheme = context.colorScheme;
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [colorScheme.surface, colorScheme.surfaceVariant],
    );
  }

  /// Error gradient
  static LinearGradient error(BuildContext context) {
    final colorScheme = context.colorScheme;
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [colorScheme.error, colorScheme.errorContainer],
    );
  }
}

/// Theme-aware colors that adapt to current theme
class AppAdaptiveColors {
  AppAdaptiveColors._();

  /// Get text color that contrasts with surface
  static Color onSurface(BuildContext context) => context.colorScheme.onSurface;

  /// Get text color that contrasts with background
  static Color onBackground(BuildContext context) =>
      context.colorScheme.onBackground;

  /// Get disabled color
  static Color disabled(BuildContext context) =>
      context.colorScheme.onSurface.withOpacity(0.38);

  /// Get hint color
  static Color hint(BuildContext context) =>
      context.colorScheme.onSurface.withOpacity(0.6);

  /// Get divider color
  static Color divider(BuildContext context) =>
      context.colorScheme.outline.withOpacity(0.12);

  /// Get shadow color
  static Color shadow(BuildContext context) =>
      context.colorScheme.shadow.withOpacity(0.16);
}
