part of 'iaccount_remote.dart';

@Injectable(as: IAccountRemoteSource)
class AccountRemoteSource extends IAccountRemoteSource {
  @override
  Future<Either<AppErrors, EmptyResponse>> login(LoginParam param) async {
    return await request(
      converter: (json) {
        return EmptyResponse.fromMap(json);
      },
      method: HttpMethod.POST,
      url: APIUrls.loginApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, MemberDeviceInfoModel>> saveDevices(
      DeviceInfoParam param) async {
    return await request(
      converter: (json) => MemberDeviceInfoModel.fromMap(json),
      method: HttpMethod.POST,
      url: APIUrls.devicesSave,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, MemberInfoModel>> resgister(
      ResgisterParam param) async {
    return await request(
      converter: (json) {
        try {
          return MemberInfoModel.fromMap(
              json["MemberInfo"] as Map<String, dynamic>);
        } catch (e) {
          return MemberInfoModel.fromMap(
              json["MemberInfo"] as Map<String, dynamic>);
        }
      },
      method: HttpMethod.POST,
      url: APIUrls.signUpApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }
  //shhgd@gshg.hh

  @override
  Future<Either<AppErrors, MemberInfoModel>> updateProfile(
      UpdateProfileParam param) async {
    return await request(
      converter: (json) =>
          MemberInfoModel.fromMap(json["MemberInfo"] as Map<String, dynamic>),
      method: HttpMethod.PATCH,
      url: APIUrls.updateProfileApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, MemberInfoModel>> getProfile(
      MemberGetParam param) async {
    return await request(
      converter: (json) {
        return MemberInfoModel.fromMap(
            json["MemberInfo"] as Map<String, dynamic>);
      },
      method: HttpMethod.POST,
      url: APIUrls.profileApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, MemberInfoModel>> retrieveProfileApi(
      MemberGetParam param) async {
    return await request(
      converter: (json) {
        return MemberInfoModel.fromMap(
            json["MemberInfo"] as Map<String, dynamic>);
      },
      method: HttpMethod.POST,
      url: APIUrls.retrieveProfileApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, SendOtpModel>> resendCode(
      ResendCodeParam param) async {
    throw UnimplementedError("Wrong api url");
    return await request(
      converter: (json) => SendOtpModel.fromMap(json),
      method: HttpMethod.POST,
      body: param.toMap(),
      url: APIUrls.verifyOtpApi,
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, SendEmailVerificationModel>> sendEmailVerification(
      SendEmailVerificationParam param) async {
    return await request(
      converter: (json) => SendEmailVerificationModel.fromMap(json),
      method: HttpMethod.POST,
      url: APIUrls.sendEmailVerificationApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, ValidateEmailVerificationModel>>
      validateEmailVerification(ValidateEmailVerificationParam param) async {
    return await request(
      converter: (json) => ValidateEmailVerificationModel.fromMap(json),
      method: HttpMethod.POST,
      url: APIUrls.validateEmailVerificationApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, ValidateOtpModel>> verifyOtp(
      VerifyOtpParam param) async {
    return await request(
      converter: (json) => ValidateOtpModel.fromMap(json),
      method: HttpMethod.POST,
      url: param.email?.isNotEmptyNorNull ?? false
          ? APIUrls.validateLoginApi
          : APIUrls.verifyOtpApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, ValidateOtpLoginModel>> verifyOtpOnLogin(
      VerifyOtpParam param) async {
    return await request(
      converter: (json) {
        print(json);
        return ValidateOtpLoginModel.fromMap(json["Authentication"]);
      },
      method: HttpMethod.POST,
      url: APIUrls.validateLoginApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, EmptyResponse>> deleteAccount(
      DeleteAccountParam param) async {
    return await request(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.DELETE,
      url: APIUrls.deleteAccountApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }
}
