import 'package:jewish_app/features/account/data/request/param/delete_account_param.dart';
import '../../../../core/models/empty_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/datasource/iaccount_remote.dart';
import '../../data/request/param/dashboard_param.dart';
import '../../data/request/param/device_info_param.dart';
import '../../data/request/param/get_otp_param.dart';
import '../../data/request/param/login_param.dart';
import '../../data/request/param/member_calendar_param.dart';
import '../../data/request/param/member_get_param.dart';
import '../../data/request/param/reset_study_dates_param.dart';
import '../../data/request/param/save_password_param.dart';
import '../../data/request/param/save_settings_param.dart';
import '../../data/request/param/social_authenticate_param.dart';
import '../../data/request/param/upload_profile_image_param.dart';
import '../../data/request/param/validate_otp_param.dart';
import '../../data/request/param/resend_code_param.dart';
import '../../data/request/param/resgister_param.dart';
import '../../data/request/param/update_profile_param.dart';
import '../../data/request/param/send_email_verification_param.dart';
import '../../data/request/param/validate_email_verification_param.dart';
import '../entity/achievements_response_entity.dart';
import '../entity/authentication_entity.dart';
import '../entity/book_stats_entity.dart';
import '../entity/calendar_entity.dart';
import '../entity/current_book_stats_entity.dart';
import '../entity/daily_chart_entity.dart';
import '../entity/member_device_info_entity.dart';
import '../entity/member_info_entity.dart';
import '../entity/partial_stats_response_entity.dart';
import '../entity/profile_image_entity.dart';
import '../entity/this_week_entity.dart';
import '../entity/send_otp_entity.dart';
import '../entity/torah_entity.dart';
import '../entity/validate_otp_entity.dart';
import '../entity/send_email_verification_entity.dart';
import '../entity/validate_email_verification_entity.dart';
import '../entity/validate_otp_login_entity.dart';

part 'account_repository.dart';

abstract class IAccountRepository extends Repository {
  Future<Result<AppErrors, AuthenticationEntity>> login(LoginParam param);

  Future<Result<AppErrors, MemberInfoEntity>> socialAuthenticate(
    SocialAuthenticateParam param,
  );

  Future<Result<AppErrors, MemberDeviceInfoEntity>> saveDevices(
    DeviceInfoParam param,
  );

  Future<Result<AppErrors, MemberInfoEntity>> resgister(ResgisterParam param);

  Future<Result<AppErrors, MemberInfoEntity>> updateProfile(
    UpdateProfileParam param,
  );

  Future<Result<AppErrors, ProfileImageEntity>> uploadProfileImage(
    UploadProfileImageParam param,
  );

  Future<Result<AppErrors, MemberInfoEntity>> getProfile(MemberGetParam param);

  Future<Result<AppErrors, MemberInfoEntity>> retrieveProfileApi(
    MemberGetParam param,
  );

  // Forgot Password Flow
  Future<Result<AppErrors, SendOtpEntity>> getOtp(GetOtpParam param);

  Future<Result<AppErrors, ValidateOtpEntity>> validateOtp(ValidateOtpParam param);

  Future<Result<AppErrors, MemberInfoEntity>> savePassword(SavePasswordParam param);

  // Settings
  Future<Result<AppErrors, MemberInfoEntity>> saveSettings(SaveSettingsParam param);

  Future<Result<AppErrors, EmptyResponse>> resetStudyDates(ResetStudyDatesParam param);

  // Dashboard APIs
  Future<Result<AppErrors, PartialStatsResponseEntity>> getDashboardPartialStats(DashboardParam param);

  Future<Result<AppErrors, List<TorahEntity>>> getDashboardTorah(DashboardParam param);

  Future<Result<AppErrors, AchievementsResponseEntity>> getDashboardAchievements(DashboardParam param);

  Future<Result<AppErrors, List<BookStatsEntity>>> getDashboardBookStats(DashboardParam param);

  Future<Result<AppErrors, List<CurrentBookStatsEntity>>> getDashboardCurrentBookStats(DashboardParam param);

  Future<Result<AppErrors, List<DailyChartEntity>>> saveUpdatedDate(
      DashboardParam param);

  Future<Result<AppErrors, List<DailyChartEntity>>> saveStartDate(
      DashboardParam param);

  // Calendar APIs
  Future<Result<AppErrors, CalendarEntity>> getMemberListCalendar(MemberCalendarParam param);

  Future<Result<AppErrors, CalendarEntity>> getMemberListCalendarNextPrevious(MemberCalendarParam param);

  // Week Content
  Future<Result<AppErrors, List<ThisWeekEntity>>> getParashaThisWeek(
      DashboardParam param);

  Future<Result<AppErrors, SendOtpEntity>> resendCode(ResendCodeParam param);

  Future<Result<AppErrors, ValidateOtpLoginEntity>> verifyOtpOnLogin(
    ValidateOtpParam param,
  );

  Future<Result<AppErrors, SendEmailVerificationEntity>> sendEmailVerification(
    SendEmailVerificationParam param,
  );

  Future<Result<AppErrors, ValidateEmailVerificationEntity>>
  validateEmailVerification(ValidateEmailVerificationParam param);

  Future<Result<AppErrors, EmptyResponse>> deleteAccount(
    DeleteAccountParam param,
  );
}
