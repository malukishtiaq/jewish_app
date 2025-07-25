import 'dart:io';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:jewish_app/export_files.dart';
import 'package:jewish_app/core/constants/shared_preference/shared_preference_keys.dart';
import 'package:flutter/material.dart';
import 'package:jewish_app/features/account/presentation/screen/login/login_screen.dart';
import 'package:jewish_app/core/common/local_storage.dart';
// import 'package:jewish_app/core/ui/show_toast.dart';
import '../../../di/service_locator.dart';
import '../../ui/widgets/restart_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class Utils {
  Utils._();

  // Cache to store file paths that are ready to share
  static final Map<String, XFile> _fileCache = {};

  /// Find if any widget has focus in the given [context] and unfocus it
  static void unFocus(BuildContext context) {
    if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
  }

  static Future<void> launchURL(Uri url, mode) async {
    if (await canLaunchUrl(url)) {
      try {
        final platformLaunchMode = !kIsWeb && Platform.isIOS
            ? LaunchMode.externalApplication
            : LaunchMode.externalNonBrowserApplication;

        await launchUrl(url, mode: mode ?? platformLaunchMode);
      } catch (e) {
        // showToast("errorOccurred".tr);
      }
    } else {
      // showToast("errorOccurred".tr);
    }
  }

  /// Prefetch a file to make sharing faster later
  static Future<void> prefetchFile(File file) async {
    try {
      // Create XFile and store in cache
      final xFile = XFile(file.path);
      _fileCache[file.path] = xFile;
    } catch (e) {
      debugPrint('Prefetch error: $e');
    }
  }

  /// Optimized share method with loading indicator and file caching
  static Future<void> shareFile({
    required BuildContext context,
    required File file,
    required Uri link,
    String? text,
    String? subject,
    bool useSharePositionOrigin = false,
  }) async {
    // Show loading indicator if sharing might take time
    final overlay = Overlay.of(context).context.findRenderObject();
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    // Create a snackbar to show progress
    final snackBar = SnackBar(
      content: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          SizedBox(width: 16),
          Text('Preparing to share...'),
        ],
      ),
      duration: Duration(seconds: 2),
    );

    // Only show loading indicator if file isn't cached
    if (!_fileCache.containsKey(file.path)) {
      scaffoldMessenger.showSnackBar(snackBar);
    }

    try {
      // Use cached file if available, otherwise create new XFile
      final xFile = _fileCache.containsKey(file.path)
          ? _fileCache[file.path]!
          : XFile(file.path);

      // Cache the file for future use if not already cached
      if (!_fileCache.containsKey(file.path)) {
        _fileCache[file.path] = xFile;
      }

      // Get render box for position
      final box = useSharePositionOrigin
          ? context.findRenderObject() as RenderBox?
          : null;

      // Share the file
      await SharePlus.instance.share(
        ShareParams(
          files: [xFile],
          text: text ?? link.toString(),
          subject: subject,
          sharePositionOrigin: useSharePositionOrigin && box != null
              ? box.localToGlobal(Offset.zero) & box.size
              : null,
        ),
      );
    } catch (e) {
      debugPrint('Share error: $e');
      // Dismiss progress snackbar if showing
      scaffoldMessenger.hideCurrentSnackBar();
      // Show error snackbar
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Sharing failed. Please try again.')),
      );
    }
  }

  static void share({
    required BuildContext context,
    required Uri link,
    String? text,
    String? subject,
    List<XFile>? files,
    bool useSharePositionOrigin = true,
  }) {
    try {
      final box = useSharePositionOrigin
          ? context.findRenderObject() as RenderBox?
          : null;

      // Share link only if no files
      if (files == null || files.isEmpty) {
        SharePlus.instance.share(
          ShareParams(
            uri: link,
            text: text,
            subject: subject,
            sharePositionOrigin: useSharePositionOrigin && box != null
                ? box.localToGlobal(Offset.zero) & box.size
                : null,
          ),
        );
        return;
      }

      // For sharing files
      SharePlus.instance.share(
        ShareParams(
          files: files,
          text: text ?? link.toString(),
          subject: subject,
          sharePositionOrigin: useSharePositionOrigin && box != null
              ? box.localToGlobal(Offset.zero) & box.size
              : null,
        ),
      );
    } catch (e) {
      debugPrint('Share error: $e');
    }
  }

  static Future<void> logout() async {
    // First set the navigation flag
    await LocalStorage.persistShouldNavigateToLogin(true);

    // Then clear the data
    await LocalStorage.persistSkipLogin(false);
    await LocalStorage.deleteKeys(SharedPreferenceKeys.REMOVE_KEYS_ON_LOGOUT);

    // Finally restart the app
    if (getIt<NavigationService>().appContext != null) {
      RestartWidget.restartApp(getIt<NavigationService>().appContext!);
    }
  }
}
