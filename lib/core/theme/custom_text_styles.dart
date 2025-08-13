import 'package:flutter/material.dart';
import 'package:jewish_app/core/common/utils/size_utils.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
class CustomTextStyles {
  // Body text styles
  static TextStyle bodyMediumGray40001(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey[400]);

  static TextStyle bodyMediumLight(BuildContext context) => Theme.of(context)
      .textTheme
      .bodyMedium!
      .copyWith(fontWeight: FontWeight.w300);

  static TextStyle bodyMediumLightblue800(BuildContext context) =>
      Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: const Color(0xFF1976D2));

  static TextStyle bodyMediumMontserrat(BuildContext context) =>
      Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontFamily: 'Montserrat');

  static TextStyle bodyMediumOnPrimary(BuildContext context) =>
      Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: Theme.of(context).colorScheme.onPrimary);

  static TextStyle bodyMediumOnPrimary_1(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
            color:
                Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.5),
          );

  static TextStyle bodyMediumRedA400(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.red[400]);

  static TextStyle bodyMediumRedA700(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.red[700]);

  static TextStyle bodySmallGray90002(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey[900]);

  // Headline text styles
  static TextStyle headlineMediumBold(BuildContext context) => Theme.of(context)
      .textTheme
      .headlineMedium!
      .copyWith(fontWeight: FontWeight.w700);

  static TextStyle headlineMediumOnPrimary(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w700,
          );

  static TextStyle headlineMediumOnPrimary_1(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          );

  static TextStyle headlineMediumPrimary(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w700,
          );

  static TextStyle headlineMediumSemiBold(BuildContext context) =>
      Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(fontWeight: FontWeight.w600);

  // Label text styles
  static TextStyle labelLargeLightblue800(BuildContext context) =>
      Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: const Color(0xFF1976D2));

  static TextStyle labelMediumOnPrimary(BuildContext context) =>
      Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          );

  // Title text styles
  static TextStyle titleLargeBold(BuildContext context) => Theme.of(context)
      .textTheme
      .titleLarge!
      .copyWith(fontWeight: FontWeight.w700);

  /// Figma: Welcome Back! -> Montserrat, size 24, weight 700, color #6F3D7C
  static TextStyle titleLargeWelcomeBack(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
            fontFamily: 'Montserrat',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF6F3D7C),
          );

  /// Welcome Back (Taz, 24, color #8A5694)
  static TextStyle welcomeBackTaz(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
            fontFamily: 'Taz',
            fontSize: 24,
            color: const Color(0xFF8A5694),
            height: 1,
          );

  static TextStyle titleLargeMontserrat(BuildContext context) =>
      Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(fontFamily: 'Montserrat');

  static TextStyle titleLargeMontserratLightblue800(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
            fontFamily: 'Montserrat',
            color: const Color(0xFF1976D2),
            fontSize: 22.fSize,
            fontWeight: FontWeight.w500,
          );

  static TextStyle titleLargeMontserratLightblue800_1(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
            fontFamily: 'Montserrat',
            color: const Color(0xFF1976D2),
          );

  static TextStyle titleMediumInter(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(fontFamily: 'Inter');

  static TextStyle titleMediumInterOnPrimary(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(
            fontFamily: 'Inter',
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
          );

  static TextStyle titleMediumInterOnPrimarySemiBold(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(
            fontFamily: 'Inter',
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 17.fSize,
            fontWeight: FontWeight.w600,
          );

  static TextStyle titleMediumInterPrimary(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(
            fontFamily: 'Inter',
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          );

  static TextStyle titleMediumInterSemiBold(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          );

  static TextStyle titleSmallGray40001(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.grey[400],
            fontWeight: FontWeight.w500,
          );

  static TextStyle titleSmallLightblue800(BuildContext context) =>
      Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: const Color(0xFF1976D2));

  static TextStyle titleSmallMedium(BuildContext context) => Theme.of(context)
      .textTheme
      .titleSmall!
      .copyWith(fontWeight: FontWeight.w500);

  static TextStyle titleSmallMontserratGray90003(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall!.copyWith(
            fontFamily: 'Montserrat',
            color: Colors.grey[900],
          );

  /// Field label (e.g., Email/Password) per Figma: size 13, weight 700
  static TextStyle fieldLabel13Bold(BuildContext context) =>
      Theme.of(context).textTheme.labelMedium!.copyWith(
            fontFamily: 'Montserrat',
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF252525),
          );

  /// Button text: Sign In (Taz, 16, white)
  static TextStyle buttonSignIn(BuildContext context) =>
      Theme.of(context).textTheme.labelLarge!.copyWith(
            fontFamily: 'Taz',
            fontSize: 16,
            color: Colors.white,
            height: 1,
            fontWeight: FontWeight.w600,
          );

  /// Forgot Password link: non-italic, 14, color #8A5694
  static TextStyle forgotPasswordLink(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: 'Montserrat',
            fontSize: 14,
            color: const Color(0xFF8A5694),
            fontStyle: FontStyle.normal,
            height: 1,
          );
}
