import 'package:flutter/foundation.dart';

@immutable
class SharedPreferenceKeys {
  static const KEY_LANGUAGE = 'language';
  static const KEY_TOKEN = 'token';
  static const MEMBER_ID = 'id';
  static const KEY_FIREBASE_TOKEN = 'firebase_token';
  static const KEY_OLD_FIREBASE_TOKEN = 'old_firebase_token';
  static const KEY_FIRST_START = 'First_start';
  static const KEY_APP_THEME = 'appTheme';
  static const KEY_SKIP_LOGIN = 'skip_login';
  static const KEY_MAP_INFO = 'map_info';
  static const KEY_NAVIGATE_TO_LOGIN = 'navigate_to_login';

  static const REMOVE_KEYS_ON_LOGOUT = [
    KEY_LANGUAGE,
    KEY_TOKEN,
    MEMBER_ID,
    KEY_FIREBASE_TOKEN,
    KEY_OLD_FIREBASE_TOKEN,
    KEY_APP_THEME,
    KEY_SKIP_LOGIN,
    KEY_MAP_INFO,
    KEY_NAVIGATE_TO_LOGIN,
  ];
}
