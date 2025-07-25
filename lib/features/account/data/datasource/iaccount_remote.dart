import 'package:jewish_app/core/common/extensions/string_extensions.dart';
import 'package:jewish_app/features/account/data/request/param/delete_account_param.dart';

import '../../../../core/models/empty_response.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/net/api_url.dart';
import '../../../../core/net/create_model_interceptor/primative_create_model_interceptor.dart';
import '../request/model/authentication_model.dart';
import '../request/model/member_device_info_model.dart';
import '../request/model/member_info_model.dart';
import '../request/model/send_otp_model.dart';
import '../request/model/validate_otp_login_model.dart';
import '../request/model/validate_otp_model.dart';
import '../request/model/send_email_verification_model.dart';
import '../request/model/validate_email_verification_model.dart';
import '../request/param/device_info_param.dart';
import '../request/param/login_param.dart';
import '../request/param/member_get_param.dart';
import '../request/param/verify_otp_param.dart';
import '../request/param/resend_code_param.dart';
import '../request/param/resgister_param.dart';
import '../request/param/update_profile_param.dart';
import '../request/param/send_email_verification_param.dart';
import '../request/param/validate_email_verification_param.dart';

part 'account_remote.dart';

abstract class IAccountRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, EmptyResponse>> login(LoginParam param);
  Future<Either<AppErrors, MemberDeviceInfoModel>> saveDevices(
    DeviceInfoParam param,
  );

  Future<Either<AppErrors, MemberInfoModel>> resgister(ResgisterParam param);

  Future<Either<AppErrors, MemberInfoModel>> updateProfile(
    UpdateProfileParam param,
  );

  Future<Either<AppErrors, MemberInfoModel>> getProfile(MemberGetParam param);

  Future<Either<AppErrors, MemberInfoModel>> retrieveProfileApi(
    MemberGetParam param,
  );

  Future<Either<AppErrors, SendOtpModel>> resendCode(ResendCodeParam param);

  Future<Either<AppErrors, ValidateOtpModel>> verifyOtp(VerifyOtpParam param);

  Future<Either<AppErrors, ValidateOtpLoginModel>> verifyOtpOnLogin(
    VerifyOtpParam param,
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
