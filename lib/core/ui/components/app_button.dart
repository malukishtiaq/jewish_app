// import 'package:flutter/material.dart';
// import 'package:jewish_app/core/theme/app_spacing.dart';
// 
// /// Standardized button component system
// abstract class AppButton extends StatelessWidget {
//   const AppButton({
//     super.key,
//     required this.onPressed,
//     required this.child,
//     this.width,
//     this.height,
//     this.padding,
//     this.margin,
//     this.isLoading = false,
//     this.isEnabled = true,
//   });
// 
//   final VoidCallback? onPressed;
//   final Widget child;
//   final double? width;
//   final double? height;
//   final EdgeInsetsGeometry? padding;
//   final EdgeInsetsGeometry? margin;
//   final bool isLoading;
//   final bool isEnabled;
// 
//   Widget _buildLoadingIndicator(BuildContext context) {
//     return SizedBox(
//       height: 20,
//       width: 20,
//       child: CircularProgressIndicator(
//         strokeWidth: 2,
//         valueColor: AlwaysStoppedAnimation<Color>(
//           Theme.of(context).colorScheme.onPrimary,
//         ),
//       ),
//     );
//   }
// 
//   Widget _buildChild(BuildContext context) {
//     if (isLoading) {
//       return _buildLoadingIndicator(context);
//     }
//     return child;
//   }
// 
//   VoidCallback? get _effectiveOnPressed {
//     if (!isEnabled || isLoading) return null;
//     return onPressed;
//   }
// }
// 
// /// Primary button using theme's primary color
// class AppPrimaryButton extends AppButton {
//   const AppPrimaryButton({
//     super.key,
//     required super.onPressed,
//     required super.child,
//     super.width,
//     super.height,
//     super.padding,
//     super.margin,
//     super.isLoading,
//     super.isEnabled,
//     this.backgroundColor,
//     this.foregroundColor,
//   });
// 
//   final Color? backgroundColor;
//   final Color? foregroundColor;
// 
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
// 
//     return Container(
//       width: width,
//       height: height ?? AppSpacing.buttonHeight,
//       margin: margin,
//       child: ElevatedButton(
//         onPressed: _effectiveOnPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: backgroundColor ?? theme.colorScheme.primary,
//           foregroundColor: foregroundColor ?? theme.colorScheme.onPrimary,
//           padding: padding ?? AppSpacing.paddingMD,
//           shape: RoundedRectangleBorder(
//             borderRadius: AppSpacing.radiusMD,
//           ),
//         ),
//         child: _buildChild(context),
//       ),
//     );
//   }
// }
// 
// /// Secondary button using theme's outline style
// class AppSecondaryButton extends AppButton {
//   const AppSecondaryButton({
//     super.key,
//     required super.onPressed,
//     required super.child,
//     super.width,
//     super.height,
//     super.padding,
//     super.margin,
//     super.isLoading,
//     super.isEnabled,
//     this.borderColor,
//     this.foregroundColor,
//   });
// 
//   final Color? borderColor;
//   final Color? foregroundColor;
// 
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
// 
//     return Container(
//       width: width,
//       height: height ?? AppSpacing.buttonHeight,
//       margin: margin,
//       child: OutlinedButton(
//         onPressed: _effectiveOnPressed,
//         style: OutlinedButton.styleFrom(
//           foregroundColor: foregroundColor ?? theme.colorScheme.primary,
//           side: BorderSide(
//             color: borderColor ?? theme.colorScheme.primary,
//             width: 1.5,
//           ),
//           padding: padding ?? AppSpacing.paddingMD,
//           shape: RoundedRectangleBorder(
//             borderRadius: AppSpacing.radiusMD,
//           ),
//         ),
//         child: _buildChild(context),
//       ),
//     );
//   }
// }
// 
// /// Text button for less prominent actions
// class AppTextButton extends AppButton {
//   const AppTextButton({
//     super.key,
//     required super.onPressed,
//     required super.child,
//     super.width,
//     super.height,
//     super.padding,
//     super.margin,
//     super.isLoading,
//     super.isEnabled,
//     this.foregroundColor,
//   });
// 
//   final Color? foregroundColor;
// 
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
// 
//     return Container(
//       width: width,
//       height: height,
//       margin: margin,
//       child: TextButton(
//         onPressed: _effectiveOnPressed,
//         style: TextButton.styleFrom(
//           foregroundColor: foregroundColor ?? theme.colorScheme.primary,
//           padding: padding ?? AppSpacing.paddingMD,
//         ),
//         child: _buildChild(context),
//       ),
//     );
//   }
// }
// 
// /// Icon button component
// class AppIconButton extends StatelessWidget {
//   const AppIconButton({
//     super.key,
//     required this.onPressed,
//     required this.icon,
//     this.size,
//     this.color,
//     this.backgroundColor,
//     this.borderRadius,
//     this.padding,
//     this.tooltip,
//     this.isEnabled = true,
//   });
// 
//   final VoidCallback? onPressed;
//   final IconData icon;
//   final double? size;
//   final Color? color;
//   final Color? backgroundColor;
//   final BorderRadius? borderRadius;
//   final EdgeInsetsGeometry? padding;
//   final String? tooltip;
//   final bool isEnabled;
// 
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final effectiveColor = color ?? theme.colorScheme.primary;
// 
//     Widget button = Container(
//       decoration: backgroundColor != null
//           ? BoxDecoration(
//               color: backgroundColor,
//               borderRadius: borderRadius ?? AppSpacing.radiusSM,
//             )
//           : null,
//       child: IconButton(
//         onPressed: isEnabled ? onPressed : null,
//         icon: Icon(
//           icon,
//           size: size ?? 24,
//           color: isEnabled ? effectiveColor : effectiveColor.withOpacity(0.5),
//         ),
//         padding: padding ?? AppSpacing.paddingSM,
//       ),
//     );
// 
//     if (tooltip != null) {
//       button = Tooltip(
//         message: tooltip!,
//         child: button,
//       );
//     }
// 
//     return button;
//   }
// }
// 
// /// Floating action button component
// class AppFAB extends StatelessWidget {
//   const AppFAB({
//     super.key,
//     required this.onPressed,
//     required this.icon,
//     this.backgroundColor,
//     this.foregroundColor,
//     this.tooltip,
//     this.size = AppFABSize.regular,
//   });
// 
//   final VoidCallback onPressed;
//   final IconData icon;
//   final Color? backgroundColor;
//   final Color? foregroundColor;
//   final String? tooltip;
//   final AppFABSize size;
// 
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
// 
//     switch (size) {
//       case AppFABSize.small:
//         return FloatingActionButton.small(
//           onPressed: onPressed,
//           backgroundColor: backgroundColor ?? theme.colorScheme.primary,
//           foregroundColor: foregroundColor ?? theme.colorScheme.onPrimary,
//           tooltip: tooltip,
//           child: Icon(icon),
//         );
//       case AppFABSize.regular:
//         return FloatingActionButton(
//           onPressed: onPressed,
//           backgroundColor: backgroundColor ?? theme.colorScheme.primary,
//           foregroundColor: foregroundColor ?? theme.colorScheme.onPrimary,
//           tooltip: tooltip,
//           child: Icon(icon),
//         );
//       case AppFABSize.large:
//         return FloatingActionButton.large(
//           onPressed: onPressed,
//           backgroundColor: backgroundColor ?? theme.colorScheme.primary,
//           foregroundColor: foregroundColor ?? theme.colorScheme.onPrimary,
//           tooltip: tooltip,
//           child: Icon(icon),
//         );
//     }
//   }
// }
// 
// /// Danger/destructive button for critical actions
// class AppDangerButton extends AppButton {
//   const AppDangerButton({
//     super.key,
//     required super.onPressed,
//     required super.child,
//     super.width,
//     super.height,
//     super.padding,
//     super.margin,
//     super.isLoading,
//     super.isEnabled,
//   });
// 
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
// 
//     return Container(
//       width: width,
//       height: height ?? AppSpacing.buttonHeight,
//       margin: margin,
//       child: ElevatedButton(
//         onPressed: _effectiveOnPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: theme.colorScheme.error,
//           foregroundColor: theme.colorScheme.onError,
//           padding: padding ?? AppSpacing.paddingMD,
//           shape: RoundedRectangleBorder(
//             borderRadius: AppSpacing.radiusMD,
//           ),
//         ),
//         child: _buildChild(context),
//       ),
//     );
//   }
// }
// 
// /// Button with gradient background
// class AppGradientButton extends AppButton {
//   const AppGradientButton({
//     super.key,
//     required super.onPressed,
//     required super.child,
//     required this.gradient,
//     super.width,
//     super.height,
//     super.padding,
//     super.margin,
//     super.isLoading,
//     super.isEnabled,
//     this.borderRadius,
//     this.textColor,
//   });
// 
//   final Gradient gradient;
//   final BorderRadius? borderRadius;
//   final Color? textColor;
// 
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
// 
//     return Container(
//       width: width,
//       height: height ?? AppSpacing.buttonHeight,
//       margin: margin,
//       decoration: BoxDecoration(
//         gradient: isEnabled ? gradient : null,
//         color: !isEnabled ? theme.disabledColor : null,
//         borderRadius: borderRadius ?? AppSpacing.radiusMD,
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: _effectiveOnPressed,
//           borderRadius: borderRadius ?? AppSpacing.radiusMD,
//           child: Container(
//             padding: padding ?? AppSpacing.paddingMD,
//             child: Center(
//               child: DefaultTextStyle(
//                 style: theme.textTheme.labelLarge!.copyWith(
//                   color: textColor ?? Colors.white,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 child: _buildChild(context),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// 
// enum AppFABSize { small, regular, large }
