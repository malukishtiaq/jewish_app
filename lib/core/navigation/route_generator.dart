import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../di/service_locator.dart';
import '../../features/account/presentation/screen/login/login_screen.dart';
import '../../features/account/presentation/screen/login/register_screen.dart';
import '../../features/home/presentation/screen/home_screen.dart';
import '../../features/home/presentation/screen/main_navigation_screen.dart';
import '../../features/library/library.dart';
import '../../features/profile/presentation/screen/update_profile_screen.dart';
import '../constants/enums/route_type.dart';
import '../ui/screens/base_screen.dart';
import 'animations/animated_route.dart';
import 'navigation_service.dart';

class ScaleFadeRoute extends PageRouteBuilder {
  final Widget page;
  final Offset? center;

  ScaleFadeRoute({
    required this.page,
    this.center,
    super.settings,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 800),
          reverseTransitionDuration: const Duration(milliseconds: 600),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final screenSize = MediaQuery.of(context).size;
            final centerPoint =
                center ?? Offset(screenSize.width / 2, screenSize.height / 2);

            final scaleAnimation = Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutExpo,
                reverseCurve: Curves.easeInExpo,
              ),
            );

            final fadeAnimation = Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutExpo,
                reverseCurve: Curves.easeInExpo,
              ),
            );

            return Transform.scale(
              scale: scaleAnimation.value,
              origin: centerPoint,
              child: FadeTransition(
                opacity: fadeAnimation,
                child: child,
              ),
            );
          },
        );
}

@lazySingleton
class NavigationRoute {
  Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // limit access on pages
    // final args = settings.arguments;

    switch (settings.name) {
      case LoginScreen.routeName:
        return _getRoute<LoginScreenParam>(
          settings: settings,
          createScreen: (param) => LoginScreen(param: param),
        );

      case RegisterScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
          settings: settings,
        );

      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const MainNavigationScreen(),
          settings: settings,
        );

      case MainNavigationScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const MainNavigationScreen(),
          settings: settings,
        );

      case LibraryScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const LibraryScreen(),
          settings: settings,
        );

      case ChapterDetailScreen.routeName:
        final args = settings.arguments;
        if (args is Map<String, dynamic>) {
          return MaterialPageRoute(
            builder: (_) => ChapterDetailScreen(
              categoryTitle: args['categoryTitle'] ?? '',
              chapters: args['chapters'] ?? <String>[],
            ),
            settings: settings,
          );
        }
        return _errorRoute();

      case UpdateProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const UpdateProfileScreen(),
          settings: settings,
        );

      default:
        return _errorRoute();
    }
  }

  Route _getRoute<ParamType>({
    required RouteSettings settings,
    required BaseScreen Function(
      ParamType param,
    ) createScreen,
    RouteType? routeType,
  }) {
    try {
      final args = settings.arguments;
      if (args != null && args is ParamType) {
        final type = routeType ?? RouteType.SCALE_FADE;
        switch (type) {
          case RouteType.FADE:
            return MaterialPageRoute(
              builder: (_) => createScreen(
                args as ParamType,
              ),
              settings: settings,
            );
          case RouteType.ANIMATED:
            return AnimatedRoute(
              page: createScreen(
                args as ParamType,
              ),
              settings: settings,
            );
          case RouteType.SCALE_FADE:
            return ScaleFadeRoute(
              page: createScreen(
                args as ParamType,
              ),
              settings: settings,
            );
        }
      }
    } catch (e) {
      return _errorRoute();
    }

    return _errorRoute();
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          backgroundColor: Theme.of(
                  getIt<NavigationService>().getNavigationKey.currentContext!)
              .scaffoldBackgroundColor,
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ROUTE ERROR CHECK THE ROUTE GENERATOR'),
          ),
        );
      },
    );
  }
}
