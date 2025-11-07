import 'package:jewish_app/core/constants/enums/verification_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jewish_app/core/providers/session_data.dart';
import 'package:jewish_app/export_files.dart';
import '../../../../../core/common/app_config.dart';
import '../../../../../core/common/local_storage.dart';
import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/ui/error_ui/error_viewer/dialog/errv_dialog_options.dart';
import '../../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
import '../../../../../di/service_locator.dart';
import '../../../data/request/param/member_get_param.dart';
import '../../../data/request/param/resend_code_param.dart';
import '../../../data/request/param/validate_otp_param.dart';
import '../../../data/request/param/send_email_verification_param.dart';
import '../../../data/request/param/validate_email_verification_param.dart';
import '../../../domain/entity/send_otp_entity.dart';
import '../../../domain/entity/validate_otp_entity.dart';
import '../../../domain/usecase/get_profile_usecase.dart';
import '../../../domain/usecase/resend_code_usecase.dart';
import '../../../domain/usecase/verify_otp_on_login_usecase.dart';
import '../../../domain/usecase/verify_otp_usecase.dart';
import '../../../domain/usecase/send_email_verification_usecase.dart';
import '../../../domain/usecase/validate_email_verification_usecase.dart';

part 'otp_cubit.freezed.dart';
part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(const OtpState.init());

  // fields

  Future<void> resendCode(VerificationType type) async {
    emit(const OtpState.optLoading());
    try {
      if (type == VerificationType.email) {
        // Use new email verification API
        final result = await getIt<SendEmailVerificationUsecase>()(
          SendEmailVerificationParam(
            membersId: getIt<SessionData>().user?.id ?? 0,
          ),
        );
        result.pick(
          onData: (data) {
            emit(
              OtpState.codeResentSuccess(
                SendOtpEntity(
                  isExists: true,
                  membersId: getIt<SessionData>().user?.id ?? 0,
                  oneTimePassword: "",
                ),
              ),
            );
          },
          onError: (error) {
            emit(OtpState.optError(error, () => resendCode(type)));
          },
        );
      } else {
        // Use existing phone verification API
        final resendCodeParam = ResendCodeParam(
          phoneNo: type == VerificationType.phone
              ? getIt<SessionData>().user?.phoneNo
              : null,
          email: type == VerificationType.email
              ? getIt<SessionData>().user?.email
              : null,
          phoneCountryCode: type == VerificationType.phone
              ? getIt<SessionData>().user?.phoneCountryCode
              : null,
        );
        final result = await getIt<ResendCodeUsecase>()(resendCodeParam);
        result.pick(
          onData: (data) {
            emit(OtpState.codeResentSuccess(data));
          },
          onError: (error) {
            emit(OtpState.optError(error, () => resendCode(type)));
          },
        );
      }
    } catch (e) {
      emit(
        OtpState.optError(
          AppErrors.customError(message: e.toString()),
          () => resendCode(type),
        ),
      );
    }
  }

  void verifyOtp(
    String text,
    VerificationType type, {
    String email = "",
  }) async {
    if (text.length < 6) {
      emit(
        OtpState.optError(
          const AppErrors.customError(
            message: "Please enter correct OTP",
            errors: {"": ""},
          ),
          () => verifyOtp(text, type, email: email),
        ),
      );
      return;
    }

    emit(const OtpState.optLoading());

    if (type == VerificationType.email) {
      // Use new email verification API
      final result = await getIt<ValidateEmailVerificationUsecase>()(
        ValidateEmailVerificationParam(
          membersId: getIt<SessionData>().user?.id ?? 0,
          otp: text,
          email: email,
          isEmail: true,
        ),
      );

      result.pick(
        onData: (data) {
          if (data.otpValid == "VALID") {
            // Update user's email verification status
            final updatedUser = getIt<SessionData>().user?.copyWith(
              isEmailVerified: true,
            );
            getIt<SessionData>().user = updatedUser;
            emit(
              OtpState.optVerifiedSuccess(
                ValidateOtpEntity(
                  otpValid: data.otpValid,
                  id: getIt<SessionData>().user?.id ?? 0,
                ),
                type,
              ),
            );
          } else {
            emit(
              OtpState.optVerificationError(
                const AppErrors.customError(
                  message: "Please enter correct OTP",
                  errors: {"": ""},
                ),
                () => verifyOtp(text, type),
                type,
              ),
            );
          }
        },
        onError: (error) {
          emit(
            OtpState.optVerificationError(
              error,
              () => verifyOtp(text, type),
              type,
            ),
          );
        },
      );
    } else {
      // Use existing phone verification API
      final result = await getIt<VerifyOtpUsecase>()(
        ValidateOtpParam(
          id: getIt<SessionData>().user?.id ?? 0,
          otp: text,
        ),
      );

      result.pick(
        onData: (data) {
          if (data.id == 0 && data.otpValid == "NOT VALID") {
            emit(
              OtpState.optVerificationError(
                const AppErrors.customError(
                  message: "Please enter correct OTP",
                  errors: {"": ""},
                ),
                () => verifyOtp(text, type),
                type,
              ),
            );
          } else {
            emit(OtpState.optVerifiedSuccess(data, type));
          }
        },
        onError: (error) {
          emit(
            OtpState.optVerificationError(
              error,
              () => verifyOtp(text, type),
              type,
            ),
          );
        },
      );
    }
  }

  void verifyOtpOnLogin(String text, {String email = ""}) async {
    if (text.length < 6) {
      emit(
        OtpState.optError(
          const AppErrors.customError(
            message: "Please enter correct OTP",
            errors: {"": ""},
          ),
          () => verifyOtpOnLogin(text, email: email),
        ),
      );
      return;
    }

    emit(const OtpState.optLoading());

    final result = await getIt<VerifyOtpOnLoginUsecase>()(
      ValidateOtpParam(
        id: getIt<SessionData>().user?.id ?? 0,
        otp: text,
      ),
    );

    result.pick(
      onData: (data) async {
        if (data.isAuthenticated) {
          // Update user's email verification status
          await LocalStorage.persistMemberId(data.membersId);
          getIt<SessionData>().setMemberId = data.membersId;
          emit(
            OtpState.optVerifiedSuccess(
              ValidateOtpEntity(
                otpValid: data.isAuthenticated ? "VALID" : "NOT VALID",
                id: data.membersId,
              ),
              VerificationType.email,
            ),
          );
        } else {
          emit(
            OtpState.optVerificationError(
              const AppErrors.customError(
                message: "Please enter correct OTP",
                errors: {"": ""},
              ),
              () => verifyOtpOnLogin(text, email: email),
              VerificationType.email,
            ),
          );
        }
      },
      onError: (error) {
        emit(
          OtpState.optVerificationError(
            error,
            () => verifyOtpOnLogin(text, email: email),
            VerificationType.email,
          ),
        );
      },
    );
  }

  Future<void> showOtp(VerificationType type) async {
    emit(const OtpState.optLoading());

    if (type == VerificationType.email) {
      // Use new email verification API
      final result = await getIt<SendEmailVerificationUsecase>()(
        SendEmailVerificationParam(
          membersId: getIt<SessionData>().user?.id ?? 0,
        ),
      );

      result.pick(
        onData: (data) {
          emit(
            OtpState.optRequestSuccess(
              SendOtpEntity(
                isExists: true,
                membersId: getIt<SessionData>().user?.id ?? 0,
                oneTimePassword: "",
              ),
            ),
          );
        },
        onError: (error) {
          emit(OtpState.optError(error, () => resendCode(type)));
        },
      );
    } else {
      // Use existing phone verification API
      final result = await getIt<ResendCodeUsecase>()(
        ResendCodeParam(
          phoneNo: type == VerificationType.phone
              ? getIt<SessionData>().user?.phoneNo
              : null,
          email: type == VerificationType.email
              ? getIt<SessionData>().user?.email
              : null,
          phoneCountryCode: type == VerificationType.phone
              ? getIt<SessionData>().user?.phoneCountryCode
              : null,
        ),
      );

      result.pick(
        onData: (data) {
          emit(
            OtpState.optRequestSuccess(
              SendOtpEntity(
                isExists: true,
                membersId: getIt<SessionData>().user?.id ?? 0,
                oneTimePassword: "",
              ),
            ),
          );
        },
        onError: (error) {
          emit(OtpState.optError(error, () => resendCode(type)));
        },
      );
    }
  }

  Future<void> continueToStart(VerificationType type) async {
    final profileResult = await getIt<GetProfileUsecase>()(
      MemberGetParam(memberId: getIt<SessionData>().memberID ?? 0),
    );
    profileResult.pick(
      onData: (data) {
        getIt<SessionData>().user = data;
        if (type == VerificationType.email &&
            (getIt<SessionData>().user?.isEmailVerified ?? false) == false) {
          emit(const OtpState.init());
        } else if (type == VerificationType.phone &&
            (getIt<SessionData>().user?.isPhoneVerified ?? false) == false) {
          emit(const OtpState.init());
        } else {
          emit(
            OtpState.optVerifiedSuccess(
              ValidateOtpEntity(
                otpValid: "VALID",
                id: getIt<SessionData>().memberID ?? 0,
              ),
              type,
            ),
          );
        }
      },
      onError: (error) {
        ErrorViewer.showError(
          context: AppConfig().appContext!,
          error: error,
          callback: () {
            continueToStart(type);
          },
          errorViewerOptions: ErrVDialogOptions(
            isDismissible: false,
            cancelOptions: ErrVButtonOptions(
              buttonText: "closeApp".tr,
              onBtnPressed: (context) {
                SystemNavigator.pop();
              },
            ),
          ),
        );
      },
    );
  }
}
