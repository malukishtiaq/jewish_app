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
  static const loginApi = '/Members/Authentication/Otp/GenerateOtp';
  static const signUpApi = '/Members/Registration/Register';
  static const verifyOtpApi = '/Members/ForgotPassword/Validate';
  static const validateLoginApi = '/Members/Authentication/Otp/ValidateOtp';

  // Email Verification (New endpoints)
  static const sendEmailVerificationApi = '/Members/Verify/SendEmail';
  static const validateEmailVerificationApi = '/Members/Verify/Validate';

  // Profile Management
  static const profileApi = '/Members/Get';
  static const updateProfileApi = '/Members/Save';
  static const uploadPicture = '/Members/Avatar/Save';
  static const deleteAccountApi = '/Members/Delete';
  static const retrieveProfileApi = '/Mobile/Members/Retrieve';

  // Settings & Security
  static const saveSettingsApi = '/Members/SaveSettings';
  static const savePasswordApi = '/Members/SavePassword';
  static const updateNotificationsSettingApi =
      "/Mobile/Members/UpdateNotifications";

  // Device Management
  static const devicesSave = '${_member}Devices/Save';
}
