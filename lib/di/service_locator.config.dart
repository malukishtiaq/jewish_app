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
import 'package:jewish_app/features/account/domain/usecase/get_profile_usecase.dart'
    as _i846;
import 'package:jewish_app/features/account/domain/usecase/login_usecase.dart'
    as _i40;
import 'package:jewish_app/features/account/domain/usecase/resend_code_usecase.dart'
    as _i194;
import 'package:jewish_app/features/account/domain/usecase/resgister_usecase.dart'
    as _i315;
import 'package:jewish_app/features/account/domain/usecase/save_devices_usecase.dart'
    as _i65;
import 'package:jewish_app/features/account/domain/usecase/send_email_verification_usecase.dart'
    as _i263;
import 'package:jewish_app/features/account/domain/usecase/update_profile_usecase.dart'
    as _i374;
import 'package:jewish_app/features/account/domain/usecase/validate_email_verification_usecase.dart'
    as _i482;
import 'package:jewish_app/features/account/domain/usecase/verify_otp_on_login_usecase.dart'
    as _i862;
import 'package:jewish_app/features/account/domain/usecase/verify_otp_usecase.dart'
    as _i113;
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
    gh.lazySingleton<_i974.Logger>(() => loggerModule.logger);
    gh.lazySingleton<_i470.HttpClient>(() => _i470.HttpClient());
    gh.lazySingleton<_i207.NavigationService>(() => _i207.NavigationService());
    gh.lazySingleton<_i1030.NavigationRoute>(() => _i1030.NavigationRoute());
    gh.factory<_i655.IAccountRemoteSource>(() => _i655.AccountRemoteSource());
    gh.factory<_i225.IAccountRepository>(
        () => _i225.AccountRepository(gh<_i655.IAccountRemoteSource>()));
    gh.singleton<_i374.UpdateProfileUsecase>(
        () => _i374.UpdateProfileUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i194.ResendCodeUsecase>(
        () => _i194.ResendCodeUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i40.LoginUsecase>(
        () => _i40.LoginUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i315.ResgisterUsecase>(
        () => _i315.ResgisterUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i846.GetProfileUsecase>(
        () => _i846.GetProfileUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i846.RetrieveProfileUsecase>(
        () => _i846.RetrieveProfileUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i51.DeleteAccountUsecase>(
        () => _i51.DeleteAccountUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i482.ValidateEmailVerificationUsecase>(() =>
        _i482.ValidateEmailVerificationUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i263.SendEmailVerificationUsecase>(() =>
        _i263.SendEmailVerificationUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i113.VerifyOtpUsecase>(
        () => _i113.VerifyOtpUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i65.SaveDevicesUsecase>(
        () => _i65.SaveDevicesUsecase(gh<_i225.IAccountRepository>()));
    gh.singleton<_i862.VerifyOtpOnLoginUsecase>(
        () => _i862.VerifyOtpOnLoginUsecase(gh<_i225.IAccountRepository>()));
    return this;
  }
}

class _$LoggerModule extends _i510.LoggerModule {}
