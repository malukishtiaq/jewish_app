import '../../../../../core/params/base_params.dart';

class SaveSettingsParam extends BaseParams {
  final int id;
  final bool? settingsIsDarkMode;
  final String? settingsStartDate;
  final int? settingsBooksId;
  final int? settingsChaptersId;
  final int? settingsCycleType;
  final bool? settingsIsNotification;
  final String? settingsNotificationTime;

  SaveSettingsParam({
    required this.id,
    this.settingsIsDarkMode,
    this.settingsStartDate,
    this.settingsBooksId,
    this.settingsChaptersId,
    this.settingsCycleType,
    this.settingsIsNotification,
    this.settingsNotificationTime,
  });

  @override
  Map<String, dynamic> toMap() => {
        "Id": id,
        if (settingsIsDarkMode != null)
          "SettingsIsDarkMode": settingsIsDarkMode.toString(),
        if (settingsStartDate != null) "SettingsStartDate": settingsStartDate,
        if (settingsBooksId != null) "SettingsBooksId": settingsBooksId,
        if (settingsChaptersId != null)
          "SettingsChaptersId": settingsChaptersId,
        if (settingsCycleType != null)
          "SettingsCycleType": settingsCycleType.toString(),
        if (settingsIsNotification != null)
          "SettingsIsNotification": settingsIsNotification.toString(),
        if (settingsNotificationTime != null)
          "SettingsNotificationTime": settingsNotificationTime,
      };
}

