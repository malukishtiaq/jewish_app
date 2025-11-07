import 'package:jewish_app/features/account/data/request/param/delete_account_param.dart';

import '../../../../core/models/empty_response.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:http_parser/http_parser.dart';

import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/net/api_url.dart';
import '../../../../core/net/create_model_interceptor/primative_create_model_interceptor.dart';
import '../request/model/achievements_response_model.dart';
import '../request/model/authentication_model.dart';
import '../request/model/book_stats_model.dart';
import '../request/model/calendar_model.dart';
import '../request/model/current_book_stats_model.dart';
import '../request/model/daily_chart_model.dart';
import '../request/model/member_device_info_model.dart';
import '../request/model/member_info_model.dart';
import '../request/model/partial_stats_response_model.dart';
import '../request/model/profile_image_model.dart';
import '../request/model/send_otp_model.dart';
import '../request/model/this_week_model.dart';
import '../request/model/torah_model.dart';
import '../request/model/validate_otp_login_model.dart';
import '../request/model/validate_otp_model.dart';
import '../request/model/send_email_verification_model.dart';
import '../request/model/validate_email_verification_model.dart';
import '../request/param/dashboard_param.dart';
import '../request/param/device_info_param.dart';
import '../request/param/get_otp_param.dart';
import '../request/param/login_param.dart';
import '../request/param/member_calendar_param.dart';
import '../request/param/member_get_param.dart';
import '../request/param/reset_study_dates_param.dart';
import '../request/param/save_password_param.dart';
import '../request/param/save_settings_param.dart';
import '../request/param/social_authenticate_param.dart';
import '../request/param/upload_profile_image_param.dart';
import '../request/param/validate_otp_param.dart';
import '../request/param/resend_code_param.dart';
import '../request/param/resgister_param.dart';
import '../request/param/update_profile_param.dart';
import '../request/param/send_email_verification_param.dart';
import '../request/param/validate_email_verification_param.dart';

part 'account_remote.dart';

abstract class IAccountRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, AuthenticationModel>> login(LoginParam param);

  Future<Either<AppErrors, MemberInfoModel>> socialAuthenticate(
    SocialAuthenticateParam param,
  );
  
  Future<Either<AppErrors, MemberDeviceInfoModel>> saveDevices(
    DeviceInfoParam param,
  );

  Future<Either<AppErrors, MemberInfoModel>> resgister(ResgisterParam param);

  Future<Either<AppErrors, MemberInfoModel>> updateProfile(
    UpdateProfileParam param,
  );

  Future<Either<AppErrors, ProfileImageModel>> uploadProfileImage(
    UploadProfileImageParam param,
  );

  Future<Either<AppErrors, MemberInfoModel>> getProfile(MemberGetParam param);

  Future<Either<AppErrors, MemberInfoModel>> retrieveProfileApi(
    MemberGetParam param,
  );

  // Forgot Password Flow
  Future<Either<AppErrors, SendOtpModel>> getOtp(GetOtpParam param);

  Future<Either<AppErrors, ValidateOtpModel>> validateOtp(ValidateOtpParam param);

  Future<Either<AppErrors, MemberInfoModel>> savePassword(SavePasswordParam param);

  // Settings
  Future<Either<AppErrors, MemberInfoModel>> saveSettings(SaveSettingsParam param);

  Future<Either<AppErrors, EmptyResponse>> resetStudyDates(ResetStudyDatesParam param);

  // Dashboard APIs - Note: Responses are wrapped in parent objects with specific keys
  Future<Either<AppErrors, PartialStatsResponseModel>> getDashboardPartialStats(DashboardParam param);

  Future<Either<AppErrors, List<TorahModel>>> getDashboardTorah(DashboardParam param);

  Future<Either<AppErrors, AchievementsResponseModel>> getDashboardAchievements(DashboardParam param);

  Future<Either<AppErrors, List<BookStatsModel>>> getDashboardBookStats(DashboardParam param);

  Future<Either<AppErrors, List<CurrentBookStatsModel>>> getDashboardCurrentBookStats(DashboardParam param);

  Future<Either<AppErrors, List<DailyChartModel>>> saveUpdatedDate(
    DashboardParam param,
  );

  Future<Either<AppErrors, List<DailyChartModel>>> saveStartDate(
    DashboardParam param,
  );

  // Calendar APIs - Both return CalendarModel
  Future<Either<AppErrors, CalendarModel>> getMemberListCalendar(MemberCalendarParam param);

  Future<Either<AppErrors, CalendarModel>> getMemberListCalendarNextPrevious(MemberCalendarParam param);

  // Week Content - Returns list (need to verify actual structure)
  Future<Either<AppErrors, List<ThisWeekModel>>> getParashaThisWeek(
    DashboardParam param,
  );

  Future<Either<AppErrors, SendOtpModel>> resendCode(ResendCodeParam param);

  Future<Either<AppErrors, ValidateOtpLoginModel>> verifyOtpOnLogin(
    ValidateOtpParam param,
  );

  Future<Either<AppErrors, SendEmailVerificationModel>> sendEmailVerification(
    SendEmailVerificationParam param,
  );

  Future<Either<AppErrors, ValidateEmailVerificationModel>>
  validateEmailVerification(ValidateEmailVerificationParam param);

  Future<Either<AppErrors, EmptyResponse>> deleteAccount(
    DeleteAccountParam param,
  );
}
