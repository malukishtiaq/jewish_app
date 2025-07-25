import 'package:flutter/material.dart';
import '../../../export_files.dart';

class AnimatedCircleButton extends StatefulWidget {
  final String text;
  final String? iconPath;
  final Widget? iconWidget;
  final bool isTrailingIcon;
  final VoidCallback onPressed;
  final Duration animationDuration;
  final Function? onAnimationComplete;
  final ButtonStyle? buttonStyle;
  final TextStyle? buttonTextStyle;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? iconHeight;
  final double? iconWidth;

  const AnimatedCircleButton({
    super.key,
    required this.text,
    this.iconPath,
    this.iconWidget,
    this.isTrailingIcon = true,
    required this.onPressed,
    this.animationDuration = const Duration(milliseconds: 300),
    this.onAnimationComplete,
    this.buttonStyle,
    this.buttonTextStyle,
    this.margin,
    this.height,
    this.iconHeight,
    this.iconWidth,
  });

  @override
  State<AnimatedCircleButton> createState() => _AnimatedCircleButtonState();
}

class _AnimatedCircleButtonState extends State<AnimatedCircleButton> {
  bool isAnimating = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Reset animation state when route changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && isAnimating) {
        setState(() => isAnimating = false);
      }
    });
  }

  void _handlePress() {
    setState(() => isAnimating = true);
    widget.onPressed();

    if (widget.onAnimationComplete != null) {
      Future.delayed(
        widget.animationDuration + const Duration(milliseconds: 100),
        () {
          widget.onAnimationComplete!();
          // Add extra delay before resetting to make it less noticeable
          Future.delayed(
            const Duration(milliseconds: 300),
            () {
              if (mounted) {
                setState(() => isAnimating = false);
              }
            },
          );
        },
      );
    }
  }

  Widget _buildIcon() {
    if (widget.iconWidget != null) {
      return widget.iconWidget!;
    }
    if (widget.iconPath != null) {
      return CustomImageView(
        imagePath: widget.iconPath!,
        height: widget.iconHeight ?? 50.h,
        width: widget.iconWidth ?? 54.h,
        fit: BoxFit.contain,
      );
    }
    return Icon(
      Icons.arrow_forward,
      color: Colors.white,
      size: 24.h,
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonHeight = widget.height ?? 50.h;

    return Container(
      height: buttonHeight,
      margin: widget.margin,
      child: AnimatedContainer(
        duration: widget.animationDuration,
        curve: Curves.easeInOutCubic,
        width: isAnimating ? buttonHeight : 335.h,
        child: ElevatedButton(
          style:
              (widget.buttonStyle ?? theme.elevatedButtonTheme.style)?.copyWith(
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(isAnimating ? buttonHeight / 2 : 25),
            )),
          ),
          onPressed: _handlePress,
          child: AnimatedContainer(
            duration: widget.animationDuration,
            curve: Curves.easeInOutCubic,
            padding: EdgeInsets.symmetric(horizontal: isAnimating ? 0 : 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!isAnimating &&
                    !widget.isTrailingIcon &&
                    (widget.iconPath != null || widget.iconWidget != null))
                  Padding(
                    padding: EdgeInsets.only(right: 8.h),
                    child: _buildIcon(),
                  ),
                if (!isAnimating)
                  Text(
                    widget.text,
                    style: widget.buttonTextStyle ?? theme.textTheme.titleLarge,
                  ),
                if (!isAnimating &&
                    widget.isTrailingIcon &&
                    (widget.iconPath != null || widget.iconWidget != null))
                  Container(
                    margin: EdgeInsets.only(left: 30.h),
                    child: _buildIcon(),
                  ),
                if (isAnimating) _buildIcon(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
