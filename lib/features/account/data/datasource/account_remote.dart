part of 'iaccount_remote.dart';

@Injectable(as: IAccountRemoteSource)
class AccountRemoteSource extends IAccountRemoteSource {
  @override
  Future<Either<AppErrors, AuthenticationModel>> login(LoginParam param) async {
    return await request(
      converter: (json) {
        // The API returns: { "Authentication": { ... } }
        final authData = json['Authentication'] as Map<String, dynamic>;
        return AuthenticationModel.fromMap(authData);
      },
      method: HttpMethod.POST,
      url: APIUrls.loginApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, MemberInfoModel>> socialAuthenticate(
      SocialAuthenticateParam param) async {
    return await request(
      converter: (json) {
        return MemberInfoModel.fromMap(
          json["MemberInfo"] as Map<String, dynamic>,
        );
      },
      method: HttpMethod.POST,
      url: APIUrls.socialAuthenticateApi,
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
        // The API returns: { "MemberInfo": { ... } }
        return MemberInfoModel.fromMap(
            json["MemberInfo"] as Map<String, dynamic>);
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
      method: HttpMethod.POST,
      url: APIUrls.updateProfileApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, ProfileImageModel>> uploadProfileImage(
      UploadProfileImageParam param) async {
    return await requestUploadFile(
      converter: (json) =>
          ProfileImageModel.fromMap(json as Map<String, dynamic>),
      url: APIUrls.uploadPicture,
      fileKey: 'File',
      filePath: param.filePath,
      data: param.toMap(),
      mediaType: MediaType('image', 'jpeg'),
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
  Future<Either<AppErrors, SendOtpModel>> getOtp(GetOtpParam param) async {
    return await request(
      converter: (json) => SendOtpModel.fromMap(json),
      method: HttpMethod.POST,
      url: APIUrls.getOtpApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, ValidateOtpModel>> validateOtp(
      ValidateOtpParam param) async {
    return await request(
      converter: (json) => ValidateOtpModel.fromMap(json),
      method: HttpMethod.POST,
      url: APIUrls.verifyOtpApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, MemberInfoModel>> savePassword(
      SavePasswordParam param) async {
    return await request(
      converter: (json) {
        // API returns: { "MemberInfo": { ... } }
        return MemberInfoModel.fromMap(
            json["MemberInfo"] as Map<String, dynamic>);
      },
      method: HttpMethod.POST,
      url: APIUrls.savePasswordApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, SendOtpModel>> resendCode(
      ResendCodeParam param) async {
    // Tanach backend uses the same endpoint as GetOtp for resending codes
    return await request(
      converter: (json) => SendOtpModel.fromMap(json),
      method: HttpMethod.POST,
      url: APIUrls.getOtpApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, MemberInfoModel>> saveSettings(
      SaveSettingsParam param) async {
    return await request(
      converter: (json) {
        // API returns: { "MemberInfo": { ... } }
        return MemberInfoModel.fromMap(
            json["MemberInfo"] as Map<String, dynamic>);
      },
      method: HttpMethod.POST,
      url: APIUrls.saveSettingsApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, EmptyResponse>> resetStudyDates(
      ResetStudyDatesParam param) async {
    return await request(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.POST,
      url: APIUrls.resetStudyDatesApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, ValidateOtpLoginModel>> verifyOtpOnLogin(
      ValidateOtpParam param) async {
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

  // Dashboard APIs
  @override
  Future<Either<AppErrors, PartialStatsResponseModel>> getDashboardPartialStats(
      DashboardParam param) async {
    return await request(
      converter: (json) => PartialStatsResponseModel.fromMap(json as Map<String, dynamic>),
      method: HttpMethod.POST,
      url: APIUrls.dashboardPartialStatsApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, List<TorahModel>>> getDashboardTorah(
      DashboardParam param) async {
    return await listRequest(
      converter: (json) => TorahModel.fromMap(json as Map<String, dynamic>),
      method: HttpMethod.POST,
      url: APIUrls.dashboardTorahApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
      key: 'Result', // Tanach API wraps list in "Result" key
    );
  }

  @override
  Future<Either<AppErrors, AchievementsResponseModel>> getDashboardAchievements(
      DashboardParam param) async {
    return await request(
      converter: (json) => AchievementsResponseModel.fromMap(json as Map<String, dynamic>),
      method: HttpMethod.POST,
      url: APIUrls.dashboardAchievementsApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, List<BookStatsModel>>> getDashboardBookStats(
      DashboardParam param) async {
    return await listRequest(
      converter: (json) => BookStatsModel.fromMap(json as Map<String, dynamic>),
      method: HttpMethod.POST,
      url: APIUrls.dashboardBookStatsApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
      key: 'Result', // Tanach API wraps list in "Result" key
    );
  }

  @override
  Future<Either<AppErrors, List<CurrentBookStatsModel>>> getDashboardCurrentBookStats(
      DashboardParam param) async {
    return await listRequest(
      converter: (json) => CurrentBookStatsModel.fromMap(json as Map<String, dynamic>),
      method: HttpMethod.POST,
      url: APIUrls.dashboardCurrentBookStatsApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
      key: 'Result', // Tanach API wraps list in "Result" key
    );
  }

  @override
  Future<Either<AppErrors, List<DailyChartModel>>> saveUpdatedDate(
      DashboardParam param) async {
    return await listRequest(
      converter: (json) => DailyChartModel.fromMap(json as Map<String, dynamic>),
      method: HttpMethod.POST,
      url: APIUrls.dashboardUpdateDateApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
      key: 'Result',
    );
  }

  @override
  Future<Either<AppErrors, List<DailyChartModel>>> saveStartDate(
      DashboardParam param) async {
    return await listRequest(
      converter: (json) => DailyChartModel.fromMap(json as Map<String, dynamic>),
      method: HttpMethod.POST,
      url: APIUrls.memberLegacySaveSettingsApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
      key: 'Result',
    );
  }

  // Calendar APIs
  @override
  Future<Either<AppErrors, CalendarModel>> getMemberListCalendar(
      MemberCalendarParam param) async {
    return await request(
      converter: (json) => CalendarModel.fromMap(json as Map<String, dynamic>),
      method: HttpMethod.POST,
      url: APIUrls.memberListCalendarApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  @override
  Future<Either<AppErrors, CalendarModel>> getMemberListCalendarNextPrevious(
      MemberCalendarParam param) async {
    return await request(
      converter: (json) => CalendarModel.fromMap(json as Map<String, dynamic>),
      method: HttpMethod.POST,
      url: APIUrls.memberListCalendarNextPreviousApi,
      body: param.toMap(),
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
    );
  }

  // Week Content
  @override
  Future<Either<AppErrors, List<ThisWeekModel>>> getParashaThisWeek(
      DashboardParam param) async {
    return await listRequest(
      converter: (json) => ThisWeekModel.fromMap(json as Map<String, dynamic>),
      method: HttpMethod.GET,
      url: APIUrls.parashaThisWeek(param.membersId),
      body: null,
      createModelInterceptor: const PrimativeCreateModelInterceptor(),
      key: 'ThisWeek',
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
