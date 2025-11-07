// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:jewish_app/core/navigation/navigation_service.dart' as _i207;
import 'package:jewish_app/core/navigation/route_generator.dart' as _i1030;
import 'package:jewish_app/core/net/http_client.dart' as _i470;
import 'package:jewish_app/core/providers/session_data.dart' as _i152;
import 'package:jewish_app/di/modules/logger_module.dart' as _i510;
import 'package:jewish_app/features/account/data/datasource/iaccount_remote.dart'
    as _i655;
import 'package:jewish_app/features/account/domain/repository/iaccount_repository.dart'
    as _i225;
import 'package:jewish_app/features/account/domain/usecase/delete_account_usecase.dart'
    as _i51;
import 'package:jewish_app/features/account/domain/usecase/get_dashboard_achievements_usecase.dart'
    as _i574;
import 'package:jewish_app/features/account/domain/usecase/get_dashboard_book_stats_usecase.dart'
    as _i674;
import 'package:jewish_app/features/account/domain/usecase/get_dashboard_current_book_stats_usecase.dart'
    as _i18;
import 'package:jewish_app/features/account/domain/usecase/get_dashboard_partial_stats_usecase.dart'
    as _i717;
import 'package:jewish_app/features/account/domain/usecase/get_dashboard_torah_usecase.dart'
    as _i753;
import 'package:jewish_app/features/account/domain/usecase/get_member_list_calendar_next_previous_usecase.dart'
    as _i114;
import 'package:jewish_app/features/account/domain/usecase/get_member_list_calendar_usecase.dart'
    as _i225;
import 'package:jewish_app/features/account/domain/usecase/get_otp_usecase.dart'
    as _i186;
import 'package:jewish_app/features/account/domain/usecase/get_parasha_this_week_usecase.dart'
    as _i998;
import 'package:jewish_app/features/account/domain/usecase/get_profile_usecase.dart'
    as _i846;
import 'package:jewish_app/features/account/domain/usecase/login_usecase.dart'
    as _i40;
import 'package:jewish_app/features/account/domain/usecase/resend_code_usecase.dart'
    as _i194;
import 'package:jewish_app/features/account/domain/usecase/reset_study_dates_usecase.dart'
    as _i316;
import 'package:jewish_app/features/account/domain/usecase/resgister_usecase.dart'
    as _i315;
import 'package:jewish_app/features/account/domain/usecase/save_devices_usecase.dart'
    as _i65;
import 'package:jewish_app/features/account/domain/usecase/save_password_usecase.dart'
    as _i609;
import 'package:jewish_app/features/account/domain/usecase/save_settings_usecase.dart'
    as _i917;
import 'package:jewish_app/features/account/domain/usecase/save_start_date_usecase.dart'
    as _i1016;
import 'package:jewish_app/features/account/domain/usecase/save_updated_date_usecase.dart'
    as _i570;
import 'package:jewish_app/features/account/domain/usecase/send_email_verification_usecase.dart'
    as _i263;
import 'package:jewish_app/features/account/domain/usecase/social_authenticate_usecase.dart'
    as _i441;
import 'package:jewish_app/features/account/domain/usecase/update_profile_usecase.dart'
    as _i374;
import 'package:jewish_app/features/account/domain/usecase/upload_profile_image_usecase.dart'
    as _i673;
import 'package:jewish_app/features/account/domain/usecase/validate_email_verification_usecase.dart'
    as _i482;
import 'package:jewish_app/features/account/domain/usecase/verify_otp_on_login_usecase.dart'
    as _i862;
import 'package:jewish_app/features/account/domain/usecase/verify_otp_usecase.dart'
    as _i113;
import 'package:jewish_app/features/home/data/repository/home_repository.dart'
    as _i512;
import 'package:jewish_app/features/home/domain/repository/i_home_repository.dart'
    as _i772;
import 'package:jewish_app/features/home/domain/usecase/get_home_achievements_usecase.dart'
    as _i1034;
import 'package:jewish_app/features/home/domain/usecase/get_home_current_book_stats_usecase.dart'
    as _i1003;
import 'package:jewish_app/features/home/domain/usecase/get_home_partial_stats_usecase.dart'
    as _i861;
import 'package:jewish_app/features/home/domain/usecase/get_home_torah_usecase.dart'
    as _i402;
import 'package:jewish_app/features/home/presentation/state_m/home_cubit.dart'
    as _i34;
import 'package:logger/logger.dart' as _i974;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final loggerModule = _$LoggerModule();
    gh.singleton<_i152.SessionData>(() => _i152.SessionData());
    gh.lazySingleton<_i207.NavigationService>(() => _i207.NavigationService());
    gh.lazySingleton<_i1030.NavigationRoute>(() => _i1030.NavigationRoute());
    gh.lazySingleton<_i470.HttpClient>(() => _i470.HttpClient());
    gh.lazySingleton<_i974.Logger>(() => loggerModule.logger);
    gh.factory<_i655.IAccountRemoteSource>(() => _i655.AccountRemoteSource());
    gh.factory<_i225.IAccountRepository>(
        () => _i225.AccountRepository(gh<_i655.IAccountRemoteSource>()));
    gh.singleton<_i51.DeleteAccountUsecase>(
        () => _i51.DeleteAccountUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i574.GetDashboardAchievementsUsecase>(() =>
        _i574.GetDashboardAchievementsUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i674.GetDashboardBookStatsUsecase>(() =>
        _i674.GetDashboardBookStatsUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i18.GetDashboardCurrentBookStatsUsecase>(() =>
        _i18.GetDashboardCurrentBookStatsUsecase(
            gh<_i225.IAccountRepository>()));
    gh.singleton<_i717.GetDashboardPartialStatsUsecase>(() =>
        _i717.GetDashboardPartialStatsUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i753.GetDashboardTorahUsecase>(
        () => _i753.GetDashboardTorahUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i114.GetMemberListCalendarNextPreviousUsecase>(() =>
        _i114.GetMemberListCalendarNextPreviousUsecase(
            gh<_i225.IAccountRepository>()));
    gh.singleton<_i225.GetMemberListCalendarUsecase>(() =>
        _i225.GetMemberListCalendarUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i186.GetOtpUsecase>(
        () => _i186.GetOtpUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i998.GetParashaThisWeekUsecase>(
        () => _i998.GetParashaThisWeekUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i846.GetProfileUsecase>(
        () => _i846.GetProfileUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i846.RetrieveProfileUsecase>(
        () => _i846.RetrieveProfileUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i40.LoginUsecase>(
        () => _i40.LoginUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i194.ResendCodeUsecase>(
        () => _i194.ResendCodeUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i316.ResetStudyDatesUsecase>(
        () => _i316.ResetStudyDatesUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i315.ResgisterUsecase>(
        () => _i315.ResgisterUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i65.SaveDevicesUsecase>(
        () => _i65.SaveDevicesUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i609.SavePasswordUsecase>(
        () => _i609.SavePasswordUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i917.SaveSettingsUsecase>(
        () => _i917.SaveSettingsUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i1016.SaveStartDateUsecase>(
        () => _i1016.SaveStartDateUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i570.SaveUpdatedDateUsecase>(
        () => _i570.SaveUpdatedDateUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i263.SendEmailVerificationUsecase>(() =>
        _i263.SendEmailVerificationUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i441.SocialAuthenticateUsecase>(
        () => _i441.SocialAuthenticateUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i374.UpdateProfileUsecase>(
        () => _i374.UpdateProfileUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i673.UploadProfileImageUsecase>(
        () => _i673.UploadProfileImageUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i482.ValidateEmailVerificationUsecase>(() =>
        _i482.ValidateEmailVerificationUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i862.VerifyOtpOnLoginUsecase>(
        () => _i862.VerifyOtpOnLoginUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i113.VerifyOtpUsecase>(
        () => _i113.VerifyOtpUsecase(gh<_i225.IAccountRepository>()));
    gh.lazySingleton<_i772.IHomeRepository>(
        () => _i512.HomeRepository(gh<_i225.IAccountRepository>()));
    gh.singleton<_i1034.GetHomeAchievementsUsecase>(
        () => _i1034.GetHomeAchievementsUsecase(gh<_i772.IHomeRepository>()));
    gh.singleton<_i861.GetHomePartialStatsUsecase>(
        () => _i861.GetHomePartialStatsUsecase(gh<_i772.IHomeRepository>()));
    gh.singleton<_i402.GetHomeTorahUsecase>(
        () => _i402.GetHomeTorahUsecase(gh<_i772.IHomeRepository>()));
    gh.singleton<_i1003.GetHomeCurrentBookStatsUsecase>(() =>
        _i1003.GetHomeCurrentBookStatsUsecase(gh<_i772.IHomeRepository>()));
    gh.factory<_i34.HomeCubit>(() => _i34.HomeCubit(
          gh<_i861.GetHomePartialStatsUsecase>(),
          gh<_i402.GetHomeTorahUsecase>(),
          gh<_i1034.GetHomeAchievementsUsecase>(),
          gh<_i1003.GetHomeCurrentBookStatsUsecase>(),
        ));
    return this;
  }
}

class _$LoggerModule extends _i510.LoggerModule {}
