import 'package:flutter/material.dart';
import 'package:jewish_app/core/theme/app_spacing.dart';

/// Standardized card component with theme-based styling
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.border,
    this.onTap,
    this.width,
    this.height,
    this.clipBehavior = Clip.antiAlias,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadius? borderRadius;
  final Border? border;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget card = Card(
      color: backgroundColor ?? theme.cardColor,
      elevation: elevation ?? 0,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? AppSpacing.radiusLG,
        side: border != null
            ? BorderSide(color: border!.top.color, width: border!.top.width)
            : BorderSide.none,
      ),
      margin: margin ?? EdgeInsets.zero,
      clipBehavior: clipBehavior,
      child: Container(
        width: width,
        height: height,
        padding: padding ?? AppSpacing.paddingMD,
        child: child,
      ),
    );

    if (onTap != null) {
      card = InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? AppSpacing.radiusLG,
        child: card,
      );
    }

    return card;
  }
}

/// Elevated card with shadow
class AppElevatedCard extends StatelessWidget {
  const AppElevatedCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.elevation = 4,
    this.borderRadius,
    this.onTap,
    this.width,
    this.height,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double elevation;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: padding,
      margin: margin,
      backgroundColor: backgroundColor,
      elevation: elevation,
      borderRadius: borderRadius,
      onTap: onTap,
      width: width,
      height: height,
      child: child,
    );
  }
}

/// Outlined card with border
class AppOutlinedCard extends StatelessWidget {
  const AppOutlinedCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1,
    this.borderRadius,
    this.onTap,
    this.width,
    this.height,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      padding: padding,
      margin: margin,
      backgroundColor: backgroundColor,
      elevation: 0,
      borderRadius: borderRadius,
      border: Border.all(
        color: borderColor ?? theme.colorScheme.outline,
        width: borderWidth,
      ),
      onTap: onTap,
      width: width,
      height: height,
      child: child,
    );
  }
}

/// Gradient card with custom gradient background
class AppGradientCard extends StatelessWidget {
  const AppGradientCard({
    super.key,
    required this.child,
    required this.gradient,
    this.padding,
    this.margin,
    this.borderRadius,
    this.onTap,
    this.width,
    this.height,
    this.border,
  });

  final Widget child;
  final Gradient gradient;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? AppSpacing.radiusLG;

    Widget card = Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: effectiveBorderRadius,
        border: border,
      ),
      child: Container(padding: padding ?? AppSpacing.paddingMD, child: child),
    );

    if (onTap != null) {
      card = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: effectiveBorderRadius,
          child: card,
        ),
      );
    }

    return card;
  }
}

/// Status card with colored left border indicator
class AppStatusCard extends StatelessWidget {
  const AppStatusCard({
    super.key,
    required this.child,
    required this.statusColor,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.statusWidth = 4,
    this.onTap,
    this.width,
    this.height,
  });

  final Widget child;
  final Color statusColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final double statusWidth;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBorderRadius = borderRadius ?? AppSpacing.radiusLG;

    return AppCard(
      padding: EdgeInsets.zero,
      margin: margin,
      backgroundColor: backgroundColor,
      borderRadius: effectiveBorderRadius,
      onTap: onTap,
      width: width,
      height: height,
      child: Row(
        children: [
          Container(
            width: statusWidth,
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.only(
                topLeft: effectiveBorderRadius.topLeft,
                bottomLeft: effectiveBorderRadius.bottomLeft,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: padding ?? AppSpacing.paddingMD,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

/// Tile card for list items
class AppTileCard extends StatelessWidget {
  const AppTileCard({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.contentPadding,
  });

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: padding ?? EdgeInsets.zero,
      margin: margin,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      onTap: onTap,
      child: ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        contentPadding: contentPadding ?? AppSpacing.paddingMD,
        onTap: onTap,
      ),
    );
  }
}

/// Loading card with shimmer effect placeholder
class AppLoadingCard extends StatelessWidget {
  const AppLoadingCard({
    super.key,
    this.width,
    this.height = 100,
    this.margin,
    this.borderRadius,
  });

  final double? width;
  final double height;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      width: width,
      height: height,
      margin: margin,
      borderRadius: borderRadius,
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceVariant.withOpacity(0.3),
          borderRadius: borderRadius ?? AppSpacing.radiusLG,
        ),
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

/// Error card for displaying error states
class AppErrorCard extends StatelessWidget {
  const AppErrorCard({
    super.key,
    required this.message,
    this.onRetry,
    this.icon,
    this.padding,
    this.margin,
    this.borderRadius,
  });

  final String message;
  final VoidCallback? onRetry;
  final IconData? icon;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      backgroundColor: theme.colorScheme.errorContainer,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon ?? Icons.error_outline,
            color: theme.colorScheme.onErrorContainer,
            size: 48,
          ),
          AppSpaces.md,
          Text(
            message,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onErrorContainer,
            ),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            AppSpaces.md,
            TextButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ],
      ),
    );
  }
}
