import 'package:flutter/material.dart';
import '../../export_files.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray90003,
      );
  static BoxDecoration get fillGray900 => BoxDecoration(
        color: appTheme.gray900,
      );
  static BoxDecoration get fillIndigo => BoxDecoration(
        color: appTheme.indigo900,
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
// Gradient decorations
  static BoxDecoration get gradientIndigoToGray => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(1, 0),
          end: const Alignment(0, 1),
          colors: [
            appTheme.indigo900.withOpacity(0),
            appTheme.indigo900,
            appTheme.gray90003
          ],
        ),
      );
// Outline decorations
  static BoxDecoration get outline => BoxDecoration(
        color: appTheme.indigo90001,
      );
  static BoxDecoration get outlineBlack9003f => BoxDecoration(
        color: appTheme.lightBlue800,
        boxShadow: [
          BoxShadow(
            color: appTheme.black9003f,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              0,
            ),
          )
        ],
      );
  static BoxDecoration get outlineBlack9003f1 => BoxDecoration(
        color: appTheme.gray900,
        boxShadow: [
          BoxShadow(
            color: appTheme.black9003f,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              0,
            ),
          )
        ],
      );
  static BoxDecoration get outlineBlack9003f2 => BoxDecoration(
        color: appTheme.lightBlue800,
        boxShadow: [
          BoxShadow(
            color: appTheme.black9003f.withOpacity(0.14),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              0,
            ),
          )
        ],
      );
  static BoxDecoration get outlineBlackF => const BoxDecoration();
  static BoxDecoration get outlineLightBlue => BoxDecoration(
        border: Border.all(
          color: appTheme.lightBlue800,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder128 => BorderRadius.circular(
        128.h,
      );
  static BorderRadius get circleBorder140 => BorderRadius.circular(
        140.h,
      );
  static BorderRadius get circleBorder22 => BorderRadius.circular(
        22.h,
      );
  static BorderRadius get circleBorder32 => BorderRadius.circular(
        32.h,
      );
// Rounded borders
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get roundedBorder3 => BorderRadius.circular(
        3.h,
      );
  static BorderRadius get roundedBorder54 => BorderRadius.circular(
        54.h,
      );
}
