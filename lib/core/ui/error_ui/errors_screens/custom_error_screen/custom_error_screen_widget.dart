part of '../error_widget.dart';

class CustomErrorScreenWidget extends StatefulWidget {
  final String message;
  final VoidCallback? callback;
  final bool? disableRetryButton;

  const CustomErrorScreenWidget({
    super.key,
    required this.message,
    this.callback,
    this.disableRetryButton,
  });

  @override
  State<CustomErrorScreenWidget> createState() =>
      _CustomErrorScreenWidgetState();
}

class _CustomErrorScreenWidgetState extends State<CustomErrorScreenWidget>
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
      content: widget.message,
      icon: Icons.refresh,
      imageUrl: AppConstants.errorInvalid,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.animLottieError,
        animationController: _controller,
      ),
    );
  }
}
