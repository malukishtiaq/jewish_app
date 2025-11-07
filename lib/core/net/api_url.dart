import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIUrls {
  APIUrls._();

  // Base configuration
  static final String baseUrl = '${dotenv.env['BASE_URL']}';

  /// Generates a complete image URL from a media content URL.
  ///
  /// Handles both absolute URLs (starting with http/https) and relative paths.
  /// For relative paths, prepends the IMAGE_URL from environment variables.
  ///
  /// Returns an empty string if [mediaContentUrl] is empty.
  static String getCoverImage(String mediaContentUrl) {
    if (mediaContentUrl.isEmpty) return "";
    final url = mediaContentUrl.replaceAll(r'\\', r'\');
    if (url.startsWith('http://') || url.startsWith('https://')) {
      return url;
    }
    return '${dotenv.env['IMAGE_URL']}/$url';
  }

  // ===== MEMBER ENDPOINTS =====
  static const _member = "/Base/Members/";

  // Authentication
  static const loginApi = '/Member/Authenticate';
  static const signUpApi = '/Member/Register';
  static const verifyOtpApi = '/Member/ValidateOtp';
  static const validateLoginApi = '/Members/Authentication/Otp/ValidateOtp';
  static const getOtpApi = '/Member/GetOtp';
  static const savePasswordApi = '/Member/SavePassword';
  static const socialAuthenticateApi = '/MEMBERS_SocialAuthenticate';

  // Email Verification (New endpoints)
  static const sendEmailVerificationApi = '/Members/Verify/SendEmail';
  static const validateEmailVerificationApi = '/Members/Verify/Validate';

  // Profile Management
  static const profileApi = '/Member/Get';
  static const updateProfileApi = '/Member/Save';
  static const uploadPicture = '/Member/UploadImage';
  static const deleteAccountApi = '/Member/Delete';
  static const retrieveProfileApi = '/Member/Get';

  // Settings & Security
  static const saveSettingsApi = '/Member/SaveSettings';
  static const resetStudyDatesApi = '/Member/ResetStudyDates';
  static const updateNotificationsSettingApi =
      "/Mobile/Members/UpdateNotifications";

  // Dashboard APIs
  static const dashboardPartialStatsApi = '/Dashboard/PartialStats';
  static const dashboardTorahApi = '/Dashboard/Torah';
  static const dashboardAchievementsApi = '/Dashboard/Achievements';
  static const dashboardBookStatsApi = '/Dashboard/BookStats';
  static const dashboardCurrentBookStatsApi = '/Dashboard/CurrentBookStats';
  static const dashboardUpdateDateApi = '/DashboardUpdateDate';
  
  // Calendar APIs
  static const memberListCalendarApi = '/Member/ListCalendar';
  static const memberListCalendarNextPreviousApi = '/Member/ListCalendarNextPrevious';
  
  // Parasha/Week Content
  static String parashaThisWeek(int memberId) => '/Parasha/ThisWeek/$memberId';
  static const memberLegacySaveSettingsApi = '/MemberSaveSettings';

  // Device Management
  static const devicesSave = '${_member}Devices/Save';
}
