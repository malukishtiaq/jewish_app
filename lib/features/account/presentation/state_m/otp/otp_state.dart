part of 'otp_cubit.dart';

@freezed
class OtpState with _$OtpState {
  const factory OtpState.init() = OtpInit;
  const factory OtpState.optLoading() = OtpLoading;
  const factory OtpState.optError(
    AppErrors error,
    VoidCallback callback,
  ) = SetupEntityError;

  const factory OtpState.optVerificationError(
    AppErrors error,
    VoidCallback callback,
    VerificationType type,
  ) = SetupEntityVerificationError;

  const factory OtpState.optVerifiedSuccess(
          ValidateOtpEntity entity, VerificationType type) =
      OtpVerifiedSuccessState;

  const factory OtpState.optRequestSuccess(SendOtpEntity entity) =
      OtpRequestSuccessState;

  const factory OtpState.profileUpdateSuccess() = ProfileUpdateSuccessState;

  const factory OtpState.codeResentSuccess(SendOtpEntity entity) =
      CodeResentSuccessState;
}
