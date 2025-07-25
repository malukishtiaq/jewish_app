part of '../error_widget.dart';

class ConnectionErrorScreenWidget extends StatefulWidget {
  final VoidCallback callback;
  final bool? disableRetryButton;

  const ConnectionErrorScreenWidget({
    super.key,
    required this.callback,
    this.disableRetryButton,
  });

  @override
  State<ConnectionErrorScreenWidget> createState() =>
      _ConnectionErrorScreenWidgetState();
}

class _ConnectionErrorScreenWidgetState
    extends State<ConnectionErrorScreenWidget> with TickerProviderStateMixin {
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
      // title: Translation.of(context).connectionErrorMessage,
      context: context,
      callback: widget.callback,
      disableRetryButton: widget.disableRetryButton ?? false,
      content: "connectionErrorMessage".tr,
      icon: Icons.refresh,
      imageUrl: AppConstants.errorInvalid,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.animLottieError,
        animationController: _controller,
      ),
    );
  }
}
