part of '../error_widget.dart';

class FormatErrorScreen extends StatefulWidget {
  final VoidCallback? callback;
  final bool? disableRetryButton;

  const FormatErrorScreen({
    super.key,
    this.callback,
    this.disableRetryButton,
  });

  @override
  State createState() => _FormatErrorScreenState();
}

class _FormatErrorScreenState extends State<FormatErrorScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildErrorScreen(
      callback: widget.callback,
      context: context,
      disableRetryButton: widget.disableRetryButton ?? false,
      content: "generalErrorMessage".tr,
      icon: Icons.refresh,
      imageUrl: AppConstants.animLottieErrorInvalid,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.animLottieError,
        animationController: _controller,
      ),
    );
  }
}
