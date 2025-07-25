import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/core/constants/app_assets.dart';
import 'package:jewish_app/features/splash/presentation/screen/widgets/progress_section.dart';
import 'package:jewish_app/features/account/presentation/screen/login/login_screen.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/common/local_storage.dart';
import '../../../../export_files.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();
    _scheduleNavigation();
  }

  void _scheduleNavigation() {
    Future.delayed(
      const Duration(milliseconds: 4000),
      () {
        if (mounted && !_isNavigating) {
          _isNavigating = true;
          _navigateToNextScreen();
        }
      },
    );
  }

  void _navigateToNextScreen() {
    if (!mounted) return;
    if (LocalStorage.shouldNavigateToLogin) {
      LocalStorage.persistShouldNavigateToLogin(false);
      Nav.off(
        LoginScreen.routeName,
        arguments: const LoginScreenParam(
          from: LoginFrom.mainScreen,
        ),
        context: context,
      );
    } else if (LocalStorage.firstStart) {
      // Nav.off(
      //   OnBoardingScreen.routeName,
      //   arguments: OnBoardingScreenParam(),
      //   context: context,
      // );
    } else if (LocalStorage.hasMemberID) {
      // Nav.off(
      //   AppMainScreen.routeName,
      //   arguments: AppMainScreenParam(),
      //   context: context,
      // );
    } else {
      Nav.off(
        LoginScreen.routeName,
        arguments: const LoginScreenParam(
          from: LoginFrom.mainScreen,
        ),
        context: context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.colorScheme.onPrimary,
        body: Stack(
          children: [
            Positioned.fill(
              child: CustomImageView(
                imagePath: AppAssets.images.splashBackground,
              ),
            ),
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xxxl * 2.5,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(),
                  ProgressSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
