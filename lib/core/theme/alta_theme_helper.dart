import 'package:jewish_app/core/common/utils/size_utils.dart';
import 'package:flutter/material.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  // final _appTheme = PrefUtils().getThemeData();

  // A map of custom color themes supported by the app
  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors(),
  };

  // A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme,
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor["primary"] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme["primary"] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.gray90003,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.onPrimary.withOpacity(1),
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(34),
          ),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
      ),
      dividerTheme: DividerThemeData(
        thickness: 5,
        space: 5,
        color: appTheme.gray40026,
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodyLarge: TextStyle(
      color: colorScheme.onPrimary.withOpacity(1),
      fontSize: 16.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: colorScheme.onPrimary.withOpacity(1),
      fontSize: 14.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: appTheme.gray40001,
      fontSize: 12.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: TextStyle(
      color: appTheme.lightBlue800,
      fontSize: 26.fSize,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      color: appTheme.lightBlue800,
      fontSize: 24.fSize,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      color: appTheme.redA400,
      fontSize: 13.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      color: colorScheme.onPrimary.withOpacity(0.35),
      fontSize: 10.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      color: colorScheme.onPrimary.withOpacity(1),
      fontSize: 20.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      color: appTheme.lightBlue800,
      fontSize: 16.fSize,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      color: colorScheme.onPrimary.withOpacity(1),
      fontSize: 14.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    ),
  );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFFCD163F),
    primaryContainer: Color(0XFFD9D9D9),
    errorContainer: Color(0XFF2E4D80),
    onError: Color(0XFFD80027),
    onPrimary: Color(0XBFFFFFFF),
    onPrimaryContainer: Color(0XFF142B55),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Blackf
  Color get black9003f => const Color(0X3F000000);
  // Blue
  Color get blueA700 => const Color(0XFF005AFF);
  // BlueGray
  Color get blueGray100 => const Color(0XFFCBCBCB);
  Color get blueGray50 => const Color(0XFFECF0F1);
  Color get blueGray900 => const Color(0XFF081E4A);
  Color get blueGray90001 => const Color(0XFF071E4A);
  Color get blueGray90002 => const Color(0XFF0C1552);
  // Gray
  Color get gray10006 => const Color(0X06F7F7F7);
  Color get gray200 => const Color(0XFFE8EAED);
  Color get gray20001 => const Color(0XFFEEEEEE);
  Color get gray20002 => const Color(0XFFF0EFEF);
  Color get gray300 => const Color(0XFFE5E5E5);
  Color get gray30001 => const Color(0XFFE3E4E8);
  Color get gray400 => const Color(0XFFB0B0B0);
  Color get gray40001 => const Color(0XFFCACACA);
  Color get gray40026 => const Color(0X26BFBFBF);
  Color get gray900 => const Color(0XFF151A28);
  Color get gray90001 => const Color(0XFF121E30);
  Color get gray90002 => const Color(0XFF251511);
  Color get gray90003 => const Color(0XFF0D111D);
  // Indigo
  Color get indigo50 => const Color(0XFFE0E6F3);
  Color get indigo600 => const Color(0XFF2E52B2);
  Color get indigo900 => const Color(0XFF0D2D6C);
  Color get indigo90001 => const Color(0XFF1B3970);
  // LightBlue
  Color get lightBlue800 => const Color(0XFF0072BC);
  Color get lightBlueA700 => const Color(0XFF0072FF);
  // Red
  Color get red500 => const Color(0XFFEA4335);
  Color get red900 => const Color(0XFFB71234);
  Color get redA400 => const Color(0XFFFF0034);
  Color get redA700 => const Color(0XFFFF0000);
}
