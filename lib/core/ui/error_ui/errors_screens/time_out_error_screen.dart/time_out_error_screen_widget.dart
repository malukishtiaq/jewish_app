part of '../error_widget.dart';

class TimeOutErrorScreenWidget extends StatefulWidget {
  final VoidCallback callback;
  final bool? disableRetryButton;

  const TimeOutErrorScreenWidget(
      {super.key, required this.callback, this.disableRetryButton});

  @override
  State createState() => _TimeOutErrorScreenWidgetState();
}

class _TimeOutErrorScreenWidgetState extends State<TimeOutErrorScreenWidget>
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
      context: context,
      callback: widget.callback,
      disableRetryButton: widget.disableRetryButton ?? false,
      content: "connectionTimeOut".tr,
      icon: Icons.refresh,
      imageUrl: AppConstants.errorTimeout,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.animLottieErrorTimeout,
        animationController: _controller,
      ),
    );
  }
}
