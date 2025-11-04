import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jewish_app/main_app.dart';

import 'core/common/analytics/app_analytics.dart';
import 'core/common/app_config.dart';
import 'core/common/local_storage.dart';
import 'core/constants/enums/app_options_enum.dart';
import 'di/service_locator.dart';

import 'dart:io';
import 'core/localization/localization_provider.dart';
import 'core/net/http_overrides.dart';
import 'core/common/utils/app_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize logger
  await AppLogger.init();

  await _initAppConfigs();
  runApp(const MainApp());

  AppConfig.clearNotificationSystemCount();
}

Future<void> _initAppConfigs() async {
  await dotenv.load(fileName: 'assets/env/dev.env');
  await LocalStorage.init();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  SystemChrome.setSystemUIChangeCallback((systemOverlaysAreVisible) async {
    if (!systemOverlaysAreVisible) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  });

  /// Injectable initialization
  await configureInjection();

  /// Init Language.
  await LocalizationProvider().fetchLocale();

  /// Init app config
  await AppConfig().initApp();

  /// Init rotation of app (Should be called after [AppConfig.initApp()])
  await _initAppRotation();

  /// Init error catcher to catch any red screen error and add ability to send
  /// a report to developer e-mail
  _initErrorCatcher();

  /// In case of network handshake error
  HttpOverrides.global = BadCertHttpOverrides();

  if (AppConfig().appOptions.enableAnalytics && false) {
    await AppAnalytics().initialize();
  }

  // await FirebaseDynamicLinksWrapper.staticServiceLock.acquire();
  // await FirebaseDynamicLinksWrapper.init();
  // FirebaseDynamicLinksWrapper.handleLaunchDynamicLink();
}

Future<void> _initAppRotation() async {
  final appOption = AppConfig().appOptions;

  switch (appOption.orientation) {
    case OrientationOptions.PORTRAIT:
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      break;
    case OrientationOptions.LANDSCAPE:
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      break;
    case OrientationOptions.BOTH:
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      break;
  }
}

void _initErrorCatcher() {
  final appOption = AppConfig().appOptions;
  if (appOption.enableErrorCatcher) {
    /// Initialize the error screen with our custom error catcher
    ErrorWidget.builder = (flutterErrorDetails) {
      // final catcherHandler = CatcherHandler();

      /// We must init the catcher handler parameters
      // catcherHandler.init();

      return const Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(bottom: 140),
          child: Center(
            child: FittedBox(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // buildErrorScreen(
                  //   disableRetryButton: true,
                  //   title: S.of(context!).errorOccurred,
                  //   content: S.of(context).reportError,
                  //   imageUrl: AppConstants.ERROR_UNKNOWING,
                  //   callback: null,
                  //   context: context,
                  // ),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Theme.of(context).primaryColor,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(15),
                  //     ),
                  //   ),
                  //   child: Text(
                  //     S.of(context).send,
                  //     style: const TextStyle(color: Colors.white),
                  //   ),
                  //   onPressed: () {
                  //     // Report? report = catcherHandler.createReport(
                  //     //     flutterErrorDetails.exception,
                  //     //     flutterErrorDetails.stack,
                  //     //     errorDetails: flutterErrorDetails);
                  //     // if (report != null) {
                  //     //   EmailManualHandler(
                  //     //     ["ishtiaq@softsmartcorp.com"],
                  //     //     emailHeader: 'MSS',
                  //     //     emailTitle:
                  //     //         'Error report ${DateFormat("MMMM d, yyyy h:m a").format(DateTime.now())}',
                  //     //   ).handle(report);
                  //     // }
                  //},
                  //)
                ],
              ),
            ),
          ),
        ),
      );
    };
  }
}
