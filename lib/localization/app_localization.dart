import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../export_files.dart';
import '../di/service_locator.dart';
import 'en_us/en_us_translations.dart';

extension LocalizationExtension on String {
  String get tr => AppLocalization.of().getString(this);
}

// ignore_for_file: must_be_immutable
class AppLocalization {
  AppLocalization(this.locale);

  Locale locale;

  static final Map<String, Map<String, String>> _localizedValues = {'en': enUs};

  static AppLocalization of() {
    final context = getIt<NavigationService>().appContext;
    return Localizations.of<AppLocalization>(context!, AppLocalization)!;
  }

  static List<String> languages() => _localizedValues.keys.toList();
  String getString(String text) =>
      _localizedValues[locale.languageCode]![text] ?? text;
}

class AltaLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AltaLocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalization.languages().contains(locale.languageCode);
//Returning a SynchronousFuture here because an async "load" operation
//cause an async "load" operation
  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(AltaLocalizationDelegate old) => false;
}
