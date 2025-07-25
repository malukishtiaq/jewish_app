import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jewish_app/core/common/utils/size_utils.dart';

class AppTheme {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(
    lightColorScheme,
    _lightFocusColor,
  );
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      iconTheme: IconThemeData(color: colorScheme.onSurface),
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      fontFamily: 'Inter',
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(color: colorScheme.primary),
        titleTextStyle: _textTheme.titleLarge?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          minimumSize: Size(double.infinity, 56.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.h),
          ),
          textStyle: _textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: colorScheme.primary,
          minimumSize: Size(double.infinity, 56.h),
          side: BorderSide(color: colorScheme.primary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.h),
          ),
          textStyle: _textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: _textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        filled: true,
        fillColor: colorScheme.surface,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurface.withOpacity(0.6),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF52059F), // Purple primary
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFE8D5FF),
    onPrimaryContainer: Color(0xFF1A0033),
    secondary: Color(0xFFCD163F), // Pink/Red accent
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFFFDAD6),
    onSecondaryContainer: Color(0xFF410002),
    tertiary: Color(0xFF8147BB), // Purple variant
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFEBDDFF),
    onTertiaryContainer: Color(0xFF2E004E),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFFFBFE),
    onBackground: Color(0xFF1C1B1F),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF1C1B1F),
    surfaceVariant: Color(0xFFE7E0EC),
    onSurfaceVariant: Color(0xFF49454F),
    outline: Color(0xFF79747E),
    outlineVariant: Color(0xFFE5E5E5),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF313033),
    onInverseSurface: Color(0xFFF4EFF4),
    inversePrimary: Color(0xFFCFBCFF),
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFCFBCFF), // Light purple for dark mode
    onPrimary: Color(0xFF1A0033),
    primaryContainer: Color(0xFF52059F),
    onPrimaryContainer: Color(0xFFE8D5FF),
    secondary: Color(0xFFFFB3AB), // Light pink for dark mode
    onSecondary: Color(0xFF680009),
    secondaryContainer: Color(0xFFCD163F),
    onSecondaryContainer: Color(0xFFFFDAD6),
    tertiary: Color(0xFFD0BCFF),
    onTertiary: Color(0xFF381E72),
    tertiaryContainer: Color(0xFF4F378B),
    onTertiaryContainer: Color(0xFFEBDDFF),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF0D111D), // Dark navy background
    onBackground: Color(0xFFE6E1E5),
    surface: Color(0xFF121E30), // Dark surface
    onSurface: Color(0xFFE6E1E5),
    surfaceVariant: Color(0xFF49454F),
    onSurfaceVariant: Color(0xFFCAC4D0),
    outline: Color(0xFF938F99),
    outlineVariant: Color(0xFF49454F),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFE6E1E5),
    onInverseSurface: Color(0xFF313033),
    inversePrimary: Color(0xFF52059F),
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontWeight: _bold,
      fontSize: 57.fSize,
      fontFamily: 'Montserrat',
    ),
    displayMedium: TextStyle(
      fontWeight: _bold,
      fontSize: 45.fSize,
      fontFamily: 'Montserrat',
    ),
    displaySmall: TextStyle(
      fontWeight: _semiBold,
      fontSize: 36.fSize,
      fontFamily: 'Montserrat',
    ),
    headlineLarge: TextStyle(
      fontWeight: _bold,
      fontSize: 32.fSize,
      fontFamily: 'Montserrat',
    ),
    headlineMedium: TextStyle(
      fontWeight: _semiBold,
      fontSize: 28.fSize,
      fontFamily: 'Montserrat',
    ),
    headlineSmall: TextStyle(
      fontWeight: _semiBold,
      fontSize: 24.fSize,
      fontFamily: 'Montserrat',
    ),
    titleLarge: TextStyle(
      fontWeight: _semiBold,
      fontSize: 22.fSize,
      fontFamily: 'Inter',
    ),
    titleMedium: TextStyle(
      fontWeight: _medium,
      fontSize: 16.fSize,
      fontFamily: 'Inter',
    ),
    titleSmall: TextStyle(
      fontWeight: _medium,
      fontSize: 14.fSize,
      fontFamily: 'Inter',
    ),
    bodyLarge: TextStyle(
      fontWeight: _regular,
      fontSize: 16.fSize,
      fontFamily: 'Inter',
    ),
    bodyMedium: TextStyle(
      fontWeight: _regular,
      fontSize: 14.fSize,
      fontFamily: 'Inter',
    ),
    bodySmall: TextStyle(
      fontWeight: _regular,
      fontSize: 12.fSize,
      fontFamily: 'Inter',
    ),
    labelLarge: TextStyle(
      fontWeight: _medium,
      fontSize: 14.fSize,
      fontFamily: 'Inter',
    ),
    labelMedium: TextStyle(
      fontWeight: _medium,
      fontSize: 12.fSize,
      fontFamily: 'Inter',
    ),
    labelSmall: TextStyle(
      fontWeight: _medium,
      fontSize: 11.fSize,
      fontFamily: 'Inter',
    ),
  );
}
