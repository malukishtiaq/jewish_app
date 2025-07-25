part of '../error_widget.dart';

class AccountNotVerifiedErrorScreen extends StatefulWidget {
  final VoidCallback? callback;
  final bool? disableRetryButton;

  const AccountNotVerifiedErrorScreen(
      {super.key, this.callback, this.disableRetryButton});

  @override
  State<AccountNotVerifiedErrorScreen> createState() =>
      _AccountNotVerifiedErrorScreenState();
}

class _AccountNotVerifiedErrorScreenState
    extends State<AccountNotVerifiedErrorScreen>
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
      content: "accountNotVerifiedErrorMessage".tr,
      icon: Icons.refresh,
      imageUrl: AppConstants.errorInvalid,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.animLottieError,
        animationController: _controller,
      ),
    );
  }
}
