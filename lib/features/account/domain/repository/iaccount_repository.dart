import 'package:jewish_app/features/account/data/request/param/delete_account_param.dart';
import '../../../../core/models/empty_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/datasource/iaccount_remote.dart';
import '../../data/request/param/device_info_param.dart';
import '../../data/request/param/login_param.dart';
import '../../data/request/param/member_get_param.dart';
import '../../data/request/param/verify_otp_param.dart';
import '../../data/request/param/resend_code_param.dart';
import '../../data/request/param/resgister_param.dart';
import '../../data/request/param/update_profile_param.dart';
import '../../data/request/param/send_email_verification_param.dart';
import '../../data/request/param/validate_email_verification_param.dart';
import '../entity/member_device_info_entity.dart';
import '../entity/member_info_entity.dart';
import '../entity/send_otp_entity.dart';
import '../entity/validate_otp_entity.dart';
import '../entity/send_email_verification_entity.dart';
import '../entity/validate_email_verification_entity.dart';
import '../entity/validate_otp_login_entity.dart';

part 'account_repository.dart';

abstract class IAccountRepository extends Repository {
  Future<Result<AppErrors, EmptyResponse>> login(LoginParam param);

  Future<Result<AppErrors, MemberDeviceInfoEntity>> saveDevices(
    DeviceInfoParam param,
  );

  Future<Result<AppErrors, MemberInfoEntity>> resgister(ResgisterParam param);

  Future<Result<AppErrors, MemberInfoEntity>> updateProfile(
    UpdateProfileParam param,
  );

  Future<Result<AppErrors, MemberInfoEntity>> getProfile(MemberGetParam param);

  Future<Result<AppErrors, MemberInfoEntity>> retrieveProfileApi(
    MemberGetParam param,
  );

  Future<Result<AppErrors, SendOtpEntity>> resendCode(ResendCodeParam param);

  Future<Result<AppErrors, ValidateOtpEntity>> verifyOtp(VerifyOtpParam param);

  Future<Result<AppErrors, ValidateOtpLoginEntity>> verifyOtpOnLogin(
    VerifyOtpParam param,
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
