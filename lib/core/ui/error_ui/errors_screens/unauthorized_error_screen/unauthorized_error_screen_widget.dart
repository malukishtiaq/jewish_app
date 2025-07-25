part of '../error_widget.dart';

class UnauthorizedErrorScreenWidget extends StatefulWidget {
  const UnauthorizedErrorScreenWidget({super.key});

  @override
  State createState() => _UnauthorizedErrorScreenWidgetState();
}

class _UnauthorizedErrorScreenWidgetState
    extends State<UnauthorizedErrorScreenWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildErrorScreen(
      callback: null,
      context: context,
      disableRetryButton: false,
      title: "unauthorized".tr,
      imageUrl: AppConstants.error403401,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.animLottieError403401,
        animationController: _controller,
      ),
    );
  }
}
