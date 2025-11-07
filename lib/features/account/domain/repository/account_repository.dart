part of 'iaccount_repository.dart';

@Injectable(as: IAccountRepository)
class AccountRepository extends IAccountRepository {
  final IAccountRemoteSource remoteDataSource;

  AccountRepository(this.remoteDataSource);

  @override
  Future<Result<AppErrors, AuthenticationEntity>> login(
      LoginParam param) async {
    return execute(
      remoteResult: await remoteDataSource.login(param),
    );
  }

  @override
  Future<Result<AppErrors, MemberInfoEntity>> socialAuthenticate(
      SocialAuthenticateParam param) async {
    return execute(
      remoteResult: await remoteDataSource.socialAuthenticate(param),
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
  Future<Result<AppErrors, ProfileImageEntity>> uploadProfileImage(
      UploadProfileImageParam param) async {
    return execute(
      remoteResult: await remoteDataSource.uploadProfileImage(param),
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
  Future<Result<AppErrors, SendOtpEntity>> getOtp(GetOtpParam param) async {
    return execute(
      remoteResult: await remoteDataSource.getOtp(param),
    );
  }

  @override
  Future<Result<AppErrors, ValidateOtpEntity>> validateOtp(
      ValidateOtpParam param) async {
    return execute(
      remoteResult: await remoteDataSource.validateOtp(param),
    );
  }

  @override
  Future<Result<AppErrors, MemberInfoEntity>> savePassword(
      SavePasswordParam param) async {
    return execute(
      remoteResult: await remoteDataSource.savePassword(param),
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
  Future<Result<AppErrors, MemberInfoEntity>> saveSettings(
      SaveSettingsParam param) async {
    return execute(
      remoteResult: await remoteDataSource.saveSettings(param),
    );
  }

  @override
  Future<Result<AppErrors, EmptyResponse>> resetStudyDates(
      ResetStudyDatesParam param) async {
    return executeForNoEntity(
      remoteResult: await remoteDataSource.resetStudyDates(param),
    );
  }

  @override
  Future<Result<AppErrors, ValidateOtpLoginEntity>> verifyOtpOnLogin(
      ValidateOtpParam param) async {
    return execute(
      remoteResult: await remoteDataSource.verifyOtpOnLogin(param),
    );
  }

  // Dashboard APIs
  @override
  Future<Result<AppErrors, PartialStatsResponseEntity>> getDashboardPartialStats(
      DashboardParam param) async {
    return execute(
      remoteResult: await remoteDataSource.getDashboardPartialStats(param),
    );
  }

  @override
  Future<Result<AppErrors, List<TorahEntity>>> getDashboardTorah(
      DashboardParam param) async {
    return executeForList(
      remoteResult: await remoteDataSource.getDashboardTorah(param),
    );
  }

  @override
  Future<Result<AppErrors, AchievementsResponseEntity>> getDashboardAchievements(
      DashboardParam param) async {
    return execute(
      remoteResult: await remoteDataSource.getDashboardAchievements(param),
    );
  }

  @override
  Future<Result<AppErrors, List<BookStatsEntity>>> getDashboardBookStats(
      DashboardParam param) async {
    return executeForList(
      remoteResult: await remoteDataSource.getDashboardBookStats(param),
    );
  }

  @override
  Future<Result<AppErrors, List<CurrentBookStatsEntity>>> getDashboardCurrentBookStats(
      DashboardParam param) async {
    return executeForList(
      remoteResult: await remoteDataSource.getDashboardCurrentBookStats(param),
    );
  }

  @override
  Future<Result<AppErrors, List<DailyChartEntity>>> saveUpdatedDate(
      DashboardParam param) async {
    return executeForList(
      remoteResult: await remoteDataSource.saveUpdatedDate(param),
    );
  }

  @override
  Future<Result<AppErrors, List<DailyChartEntity>>> saveStartDate(
      DashboardParam param) async {
    return executeForList(
      remoteResult: await remoteDataSource.saveStartDate(param),
    );
  }

  // Calendar APIs
  @override
  Future<Result<AppErrors, CalendarEntity>> getMemberListCalendar(
      MemberCalendarParam param) async {
    return execute(
      remoteResult: await remoteDataSource.getMemberListCalendar(param),
    );
  }

  @override
  Future<Result<AppErrors, CalendarEntity>> getMemberListCalendarNextPrevious(
      MemberCalendarParam param) async {
    return execute(
      remoteResult: await remoteDataSource.getMemberListCalendarNextPrevious(param),
    );
  }

  // Week Content
  @override
  Future<Result<AppErrors, List<ThisWeekEntity>>> getParashaThisWeek(
      DashboardParam param) async {
    return executeForList(
      remoteResult: await remoteDataSource.getParashaThisWeek(param),
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
