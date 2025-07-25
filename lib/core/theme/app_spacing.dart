import 'package:flutter/material.dart';
import 'package:jewish_app/core/common/utils/size_utils.dart';

/// App Spacing constants for consistent spacing throughout the app
class AppSpacing {
  AppSpacing._();

  // Basic spacing units
  static double get xs => 4.h;
  static double get sm => 8.h;
  static double get md => 16.h;
  static double get lg => 24.h;
  static double get xl => 32.h;
  static double get xxl => 48.h;
  static double get xxxl => 64.h;

  // Specific spacing for common UI elements
  static double get buttonHeight => 56.h;
  static double get smallButtonHeight => 40.h;
  static double get inputHeight => 56.h;
  static double get cardPadding => 16.h;
  static double get screenPadding => 20.h;
  static double get sectionSpacing => 32.h;

  // Edge Insets shortcuts
  static EdgeInsets get paddingXS => EdgeInsets.all(xs);
  static EdgeInsets get paddingSM => EdgeInsets.all(sm);
  static EdgeInsets get paddingMD => EdgeInsets.all(md);
  static EdgeInsets get paddingLG => EdgeInsets.all(lg);
  static EdgeInsets get paddingXL => EdgeInsets.all(xl);

  static EdgeInsets get horizontalXS => EdgeInsets.symmetric(horizontal: xs);
  static EdgeInsets get horizontalSM => EdgeInsets.symmetric(horizontal: sm);
  static EdgeInsets get horizontalMD => EdgeInsets.symmetric(horizontal: md);
  static EdgeInsets get horizontalLG => EdgeInsets.symmetric(horizontal: lg);
  static EdgeInsets get horizontalXL => EdgeInsets.symmetric(horizontal: xl);

  static EdgeInsets get verticalXS => EdgeInsets.symmetric(vertical: xs);
  static EdgeInsets get verticalSM => EdgeInsets.symmetric(vertical: sm);
  static EdgeInsets get verticalMD => EdgeInsets.symmetric(vertical: md);
  static EdgeInsets get verticalLG => EdgeInsets.symmetric(vertical: lg);
  static EdgeInsets get verticalXL => EdgeInsets.symmetric(vertical: xl);

  // Screen padding
  static EdgeInsets get screenHorizontal =>
      EdgeInsets.symmetric(horizontal: screenPadding);
  static EdgeInsets get screenAll => EdgeInsets.all(screenPadding);

  // Border radius
  static BorderRadius get radiusXS => BorderRadius.circular(4.h);
  static BorderRadius get radiusSM => BorderRadius.circular(8.h);
  static BorderRadius get radiusMD => BorderRadius.circular(12.h);
  static BorderRadius get radiusLG => BorderRadius.circular(16.h);
  static BorderRadius get radiusXL => BorderRadius.circular(24.h);
  static BorderRadius get radiusXXL => BorderRadius.circular(32.h);

  // Common sizes
  static Size get buttonSize => Size(double.infinity, buttonHeight);
  static Size get smallButtonSize => Size(120.h, smallButtonHeight);
  static Size get iconSize => Size(24.h, 24.h);
  static Size get largeIconSize => Size(32.h, 32.h);
  static Size get avatarSize => Size(40.h, 40.h);
  static Size get largeAvatarSize => Size(64.h, 64.h);
}

/// Extension for easy spacing widgets
extension SpacingWidgets on num {
  Widget get verticalSpace => SizedBox(height: toDouble());
  Widget get horizontalSpace => SizedBox(width: toDouble());
}

/// Predefined spacing widgets for quick use
class AppSpaces {
  AppSpaces._();

  static Widget get xs => SizedBox(height: AppSpacing.xs);
  static Widget get sm => SizedBox(height: AppSpacing.sm);
  static Widget get md => SizedBox(height: AppSpacing.md);
  static Widget get lg => SizedBox(height: AppSpacing.lg);
  static Widget get xl => SizedBox(height: AppSpacing.xl);
  static Widget get xxl => SizedBox(height: AppSpacing.xxl);

  static Widget get hXS => SizedBox(width: AppSpacing.xs);
  static Widget get hSM => SizedBox(width: AppSpacing.sm);
  static Widget get hMD => SizedBox(width: AppSpacing.md);
  static Widget get hLG => SizedBox(width: AppSpacing.lg);
  static Widget get hXL => SizedBox(width: AppSpacing.xl);
  static Widget get hXXL => SizedBox(width: AppSpacing.xxl);
}
