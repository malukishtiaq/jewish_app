import '../../../export_files.dart';

enum LanguagesEnum { english, arabic, kurdish }

LanguagesEnum mapStringToLanguagesEnum(String language) {
  if (language == AppConstants.langEn) return LanguagesEnum.english;
  if (language == AppConstants.langAr) return LanguagesEnum.arabic;

  /// Fallback
  return LanguagesEnum.english;
}

String mapLanguageEnumToString(LanguagesEnum language) {
  switch (language) {
    case LanguagesEnum.english:
      return AppConstants.langEn;
    case LanguagesEnum.arabic:
      return AppConstants.langAr;
    default:
      return AppConstants.langEn;
  }
}
