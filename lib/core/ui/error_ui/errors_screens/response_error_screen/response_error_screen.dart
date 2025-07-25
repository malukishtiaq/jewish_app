part of '../error_widget.dart';

class ResponseErrorScreen extends StatefulWidget {
  final VoidCallback? callback;
  final bool? disableRetryButton;

  const ResponseErrorScreen(
      {super.key, this.callback, this.disableRetryButton});

  @override
  State createState() => _ResponseErrorScreenState();
}

class _ResponseErrorScreenState extends State<ResponseErrorScreen>
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
      callback: widget.callback,
      context: context,
      disableRetryButton: widget.disableRetryButton ?? false,
      content: "responseError".tr,
      icon: Icons.refresh,
      imageUrl: AppConstants.errorInvalid,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.animLottieError,
        animationController: _controller,
      ),
    );
  }
}
