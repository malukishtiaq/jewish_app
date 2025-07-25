part of '../error_widget.dart';

class SocketErrorScreen extends StatefulWidget {
  final VoidCallback callback;
  final bool? disableRetryButton;

  const SocketErrorScreen({
    super.key,
    required this.callback,
    this.disableRetryButton,
  });

  @override
  State createState() => _SocketErrorScreentState();
}

class _SocketErrorScreentState extends State<SocketErrorScreen>
    with TickerProviderStateMixin {
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
      title: "connectionErrorMessage".tr,
      context: context,
      callback: widget.callback,
      disableRetryButton: widget.disableRetryButton ?? false,
      // content: Translation.of(context).connectionErrorMessage,
      icon: Icons.refresh,
      imageUrl: AppConstants.errorInvalid,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.animLottieError,
        animationController: _controller,
      ),
    );
  }
}
