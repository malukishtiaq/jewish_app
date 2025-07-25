import 'package:jewish_app/export_files.dart';

extension LocalizationExtension on String {
  /// Fetches the translated string
  String get tr => AppLocalization.of().getString(this);

  /// Fetches the translated string and replaces placeholders with the provided arguments
  String trWithArgs(Map<String, String> args) {
    String translated = AppLocalization.of().getString(this);
    args.forEach((key, value) {
      translated = translated.replaceAll('{$key}', value);
    });
    return translated;
  }
}
