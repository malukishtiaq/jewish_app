import 'package:jewish_app/core/common/utils/size_utils.dart';
import 'package:flutter/material.dart';

import 'alta_theme_helper.dart';

extension on TextStyle {
  TextStyle get inter {
    return copyWith(fontFamily: 'Inter');
  }

  TextStyle get montserrat {
    return copyWith(fontFamily: 'Montserrat');
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static TextStyle get bodyMediumGray40001 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray40001);

  static TextStyle get bodyMediumLight =>
      theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w300);
  static TextStyle get bodyMediumLightblue800 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.lightBlue800);
  static get bodyMediumMontserrat => theme.textTheme.bodyMedium!.montserrat;
  static TextStyle get bodyMediumOnPrimary =>
      theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.onPrimary);
  static TextStyle get bodyMediumOnPrimary_1 => theme.textTheme.bodyMedium!
      .copyWith(color: theme.colorScheme.onPrimary.withOpacity(0.5));
  static TextStyle get bodyMediumRedA400 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.redA400);
  static TextStyle get bodyMediumRedA700 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.redA700);
  static TextStyle get bodySmallGray90002 =>
      theme.textTheme.bodySmall!.copyWith(color: appTheme.gray90002);
  // Headline text style
  static TextStyle get headlineMediumBold =>
      theme.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700);
  static TextStyle get headlineMediumOnPrimary =>
      theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static TextStyle get headlineMediumOnPrimary_1 => theme
      .textTheme
      .headlineMedium!
      .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1));
  static TextStyle get headlineMediumPrimary => theme.textTheme.headlineMedium!
      .copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w700);
  static TextStyle get headlineMediumSemiBold =>
      theme.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600);
  // Label text style
  static TextStyle get labelLargeLightblue800 =>
      theme.textTheme.labelLarge!.copyWith(color: appTheme.lightBlue800);
  static TextStyle get labelMediumOnPrimary => theme.textTheme.labelMedium!
      .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1));
  // Title text style
  static TextStyle get titleLargeBold =>
      theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700);
  static get titleLargeMontserrat => theme.textTheme.titleLarge!.montserrat;
  static TextStyle get titleLargeMontserratLightblue800 =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: appTheme.lightBlue800,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleLargeMontserratLightblue800_1 => theme
      .textTheme
      .titleLarge!
      .montserrat
      .copyWith(color: appTheme.lightBlue800);
  static get titleMediumInter => theme.textTheme.titleMedium!.inter;
  static TextStyle get titleMediumInterOnPrimary =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleMediumInterOnPrimarySemiBold =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontSize: 17.fSize,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleMediumInterPrimary => theme
      .textTheme
      .titleMedium!
      .inter
      .copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w600);
  static TextStyle get titleMediumInterSemiBold =>
      theme.textTheme.titleMedium!.inter.copyWith(fontWeight: FontWeight.w600);
  static TextStyle get titleSmallGray40001 => theme.textTheme.titleSmall!
      .copyWith(color: appTheme.gray40001, fontWeight: FontWeight.w500);
  static TextStyle get titleSmallLightblue800 =>
      theme.textTheme.titleSmall!.copyWith(color: appTheme.lightBlue800);
  static TextStyle get titleSmallMedium =>
      theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500);
  static TextStyle get titleSmallMontserratGray90003 => theme
      .textTheme
      .titleSmall!
      .montserrat
      .copyWith(color: appTheme.gray90003, fontWeight: FontWeight.w600);
}
