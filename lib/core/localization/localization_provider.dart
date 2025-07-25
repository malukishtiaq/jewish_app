import 'package:flutter/material.dart';
import 'package:jewish_app/core/common/local_storage.dart';
import 'package:jewish_app/main.dart';

import '../../export_files.dart';
import '../constants/shared_preference/shared_preference_keys.dart';

class LocalizationProvider extends ChangeNotifier {
  static final _instance = LocalizationProvider._internal();

  factory LocalizationProvider() => _instance;

  LocalizationProvider._internal();

  Locale _appLocale = Locale(AppConstants.langEn);

  /// To know if this first time run the application or not
  bool _firstStart = false;

  /// Get current Locale supported
  Locale get appLocal => _appLocale;

  String get currentLanguage => appLocal.languageCode;

  /// Get and set first start
  bool get firstStart => _firstStart;

  void firstStartOff() {
    /// firstStart = true not touchable from outside
    _firstStart = false;
  }

  /// Fetch app locale, called in [main]
  fetchLocale() async {
    var prefs = LocalStorage.sharedPreferences;

    /// Check if the application is first start or not
    if (prefs.getBool(SharedPreferenceKeys.KEY_FIRST_START) == null) {
      /// Set first start is true
      await prefs.setBool(SharedPreferenceKeys.KEY_FIRST_START, true);
      _firstStart = true;
    }
    if (prefs.getString(SharedPreferenceKeys.KEY_LANGUAGE) == null) {
      _appLocale = Locale(AppConstants.langEn);
      await prefs.setString(
        SharedPreferenceKeys.KEY_LANGUAGE,
        AppConstants.langEn,
      );
      return Null;
    }
    String? languageCode = prefs.getString(SharedPreferenceKeys.KEY_LANGUAGE);
    _appLocale = Locale(languageCode ?? AppConstants.langEn);

    return Null;
  }

  Future<void> changeLanguage(Locale type, BuildContext context) async {
    var prefs = LocalStorage.sharedPreferences;
    if (_appLocale == type) {
      return;
    }
    _appLocale = type;

    if (type == Locale(AppConstants.langAr)) {
      await prefs.setString(
        SharedPreferenceKeys.KEY_LANGUAGE,
        AppConstants.langAr,
      );
    } else {
      await prefs.setString(
        SharedPreferenceKeys.KEY_LANGUAGE,
        AppConstants.langEn,
      );
    }
    notifyListeners();
  }
}
