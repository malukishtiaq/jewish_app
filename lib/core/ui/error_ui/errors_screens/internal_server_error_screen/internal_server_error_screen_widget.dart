part of '../error_widget.dart';

class InternalServerErrorScreenWidget extends StatefulWidget {
  final VoidCallback? callback;
  final bool? disableRetryButton;

  const InternalServerErrorScreenWidget({
    super.key,
    this.callback,
    this.disableRetryButton,
  });

  @override
  State createState() => _InternalServerErrorScreenWidgetState();
}

class _InternalServerErrorScreenWidgetState
    extends State<InternalServerErrorScreenWidget>
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
      content: "internalServerErrorMessage".tr,
      icon: Icons.refresh,
      imageUrl: AppConstants.errorServer,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.animLottieErrorServer,
        animationController: _controller,
      ),
    );
  }
}
