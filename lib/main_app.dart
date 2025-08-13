import 'package:flutter/material.dart';
import 'package:jewish_app/di/service_locator.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
// import 'package:sizer/sizer.dart';

import 'core/common/provider_list.dart';
import 'core/theme/app_theme.dart';

import 'core/navigation/route_generator.dart';
import 'core/theme/bloc/theme_bloc.dart';
import 'export_files.dart';
import 'core/ui/widgets/restart_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/splash/presentation/screens/judaism_splash_screen.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RestartWidget(child: multiProvider(context));
  }

  Widget multiProvider(BuildContext context) {
    return MultiProvider(
      providers: [...ApplicationProvider().dependItems],
      child: RefreshConfiguration(
        dragSpeedRatio: 0.75,
        headerBuilder: () => const MaterialClassicHeader(
          color: Color(0xFF52059F),
          backgroundColor: Colors.white,
          distance: 15,
          height: 20,
        ),
        child: altaSizer(),
      ),
    );
  }

  Sizer altaSizer() {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(
          create: (context) => ThemeBloc(ThemeState(themeType: "light")),
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                title: AppConstants.titleAppName,
                theme: AppTheme.lightThemeData,
                darkTheme: AppTheme.darkThemeData,
                themeMode: ThemeMode.light,
                // navigatorKey: NavigatorService.navigatorKey,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  AltaLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [Locale('en', '')],
                navigatorKey: getIt<NavigationService>().getNavigationKey,
                onGenerateRoute: getIt<NavigationRoute>().generateRoute,
                initialRoute: "/",
                home: _isInitialized
                    ? const JudaismSplashScreen()
                    : const SizedBox(),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    ApplicationProvider().dispose(context);
    super.dispose();
  }
}
