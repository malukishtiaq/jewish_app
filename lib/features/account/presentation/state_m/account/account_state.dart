part of 'account_cubit.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState.accountInit() = AccountInit;
  const factory AccountState.accountLoading() = AccountLoading;
  const factory AccountState.accountError(
    AppErrors error,
    VoidCallback callback,
  ) = AccountError;

  const factory AccountState.registerError(
    AppErrors error,
    VoidCallback callback,
    ResgisterParam param,
  ) = RegisterError;

  const factory AccountState.loginSuccess(
    MemberInfoEntity accountEntity,
  ) = LoginSuccessState;

  const factory AccountState.userRegisteredSuccess(
      MemberInfoEntity accountEntity) = UserRegisteredSuccessState;

  const factory AccountState.userLoginSuccess(String email) =
      UserLoginSuccessState;

  const factory AccountState.accountVerifiedSuccess(ValidateOtpEntity entity) =
      AccountVerifiedSuccessState;

  const factory AccountState.profileUpdateSuccess() = ProfileUpdateSuccessState;

  const factory AccountState.profileLoaded(
    MemberInfoEntity accountEntity,
  ) = ProfileLoadedState;

  const factory AccountState.forgotPasswordRequestSuccess(
      SendOtpEntity entity) = ForgotPasswordRequestSuccessState;

  const factory AccountState.resetPasswordSuccess() = ResetPasswordSuccessState;

  const factory AccountState.codeResentSuccess(SendOtpEntity entity) =
      CodeResentSuccessState;

  const factory AccountState.voucherRedeemedSuccess() =
      VoucherRedeemedSuccessState;

  const factory AccountState.accountDeletedSuccess() =
      AccountDeletedSuccessState;

  const factory AccountState.showDeleteData() = ShowDeleteDataState;
  const factory AccountState.showDeleteAccount() = ShowDeleteAccountState;

  const factory AccountState.socialMediaSuccess() =
      SocialGmailLoginRequestSuccessState;

  const factory AccountState.socialFBLoginRequestSuccess() =
      SocialFBLoginRequestSuccessState;

  const factory AccountState.socialLinkedInLoginRequestSuccess() =
      SocialLinkedInLoginRequestSuccessState;

  const factory AccountState.socialAppleLoginRequestSuccess() =
      SocialAppleLoginRequestSuccessState;

  const factory AccountState.passwordVisibilityChanged(bool value) =
      PasswordVisibilityChanged;

  const factory AccountState.confirmPasswordVisibilityChanged(bool value) =
      ConfirmPasswordVisibilityChanged;

  const factory AccountState.notificationToggelled(bool value) =
      NotificationToggelled;

  const factory AccountState.emailNotificationToggelled(bool value) =
      EmailNotificationToggelled;

  const factory AccountState.smsNotificationToggelled(bool value) =
      SmsNotificationToggelled;

  const factory AccountState.faceidToggelled(bool value) = FaceIdToggelled;

  const factory AccountState.profilePictureUrl(String value) =
      ProfilePictureUrl;

  const factory AccountState.newProfilePicture(XFile? value) =
      NewProfilePicture;

  const factory AccountState.retrieveProfileSuccess(MemberInfoEntity entity) =
      RetrieveProfileSuccessState;
}
