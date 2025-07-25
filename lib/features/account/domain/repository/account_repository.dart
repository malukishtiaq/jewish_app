part of 'iaccount_repository.dart';

@Injectable(as: IAccountRepository)
class AccountRepository extends IAccountRepository {
  final IAccountRemoteSource remoteDataSource;

  AccountRepository(this.remoteDataSource);

  @override
  Future<Result<AppErrors, EmptyResponse>> login(LoginParam param) async {
    return executeForNoEntity(
      remoteResult: await remoteDataSource.login(param),
    );
  }

  @override
  Future<Result<AppErrors, MemberDeviceInfoEntity>> saveDevices(
      DeviceInfoParam param) async {
    return execute(
      remoteResult: await remoteDataSource.saveDevices(param),
    );
  }

  @override
  Future<Result<AppErrors, MemberInfoEntity>> resgister(
      ResgisterParam param) async {
    return execute(
      remoteResult: await remoteDataSource.resgister(param),
    );
  }

  @override
  Future<Result<AppErrors, MemberInfoEntity>> updateProfile(
      UpdateProfileParam param) async {
    return execute(
      remoteResult: await remoteDataSource.updateProfile(param),
    );
  }

  @override
  Future<Result<AppErrors, MemberInfoEntity>> getProfile(
      MemberGetParam param) async {
    return execute(
      remoteResult: await remoteDataSource.getProfile(param),
    );
  }

  @override
  Future<Result<AppErrors, MemberInfoEntity>> retrieveProfileApi(
      MemberGetParam param) async {
    return execute(
      remoteResult: await remoteDataSource.retrieveProfileApi(param),
    );
  }

  @override
  Future<Result<AppErrors, SendOtpEntity>> resendCode(
      ResendCodeParam param) async {
    return execute(
      remoteResult: await remoteDataSource.resendCode(param),
    );
  }

  @override
  Future<Result<AppErrors, ValidateOtpEntity>> verifyOtp(
      VerifyOtpParam param) async {
    return execute(
      remoteResult: await remoteDataSource.verifyOtp(param),
    );
  }

  @override
  Future<Result<AppErrors, ValidateOtpLoginEntity>> verifyOtpOnLogin(
      VerifyOtpParam param) async {
    return execute(
      remoteResult: await remoteDataSource.verifyOtpOnLogin(param),
    );
  }

  @override
  Future<Result<AppErrors, SendEmailVerificationEntity>> sendEmailVerification(
      SendEmailVerificationParam param) async {
    return execute(
      remoteResult: await remoteDataSource.sendEmailVerification(param),
    );
  }

  @override
  Future<Result<AppErrors, ValidateEmailVerificationEntity>>
      validateEmailVerification(ValidateEmailVerificationParam param) async {
    return execute(
      remoteResult: await remoteDataSource.validateEmailVerification(param),
    );
  }

  @override
  Future<Result<AppErrors, EmptyResponse>> deleteAccount(
      DeleteAccountParam param) async {
    return executeForNoEntity(
      remoteResult: await remoteDataSource.deleteAccount(param),
    );
  }
}
