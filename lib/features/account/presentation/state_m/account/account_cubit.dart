import 'dart:async';

import 'package:jewish_app/core/constants/enums/verification_type.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jewish_app/core/common/local_storage.dart';
import 'package:jewish_app/export_files.dart';
import 'package:jewish_app/features/account/data/request/param/resend_code_param.dart';
import 'package:jewish_app/features/account/data/request/param/update_profile_param.dart';
import '../../../../../core/common/utils/utils.dart';
import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/net/net.dart';
import '../../../../../core/providers/session_data.dart';
import '../../../../../di/service_locator.dart';
import '../../../data/request/param/delete_account_param.dart';
import '../../../data/request/param/login_param.dart';
import '../../../data/request/param/resgister_param.dart';
import '../../../data/request/param/verify_otp_param.dart';
import '../../../data/request/param/send_email_verification_param.dart';
import '../../../data/request/param/validate_email_verification_param.dart';
import '../../../domain/entity/member_info_entity.dart';
import '../../../domain/entity/send_otp_entity.dart';
import '../../../domain/entity/validate_otp_entity.dart';
import '../../../domain/usecase/delete_account_usecase.dart';
import '../../../domain/usecase/login_usecase.dart';
import '../../../domain/usecase/resend_code_usecase.dart';
import '../../../domain/usecase/resgister_usecase.dart';
import '../../../domain/usecase/update_profile_usecase.dart';
import '../../../domain/usecase/verify_otp_usecase.dart';
import '../../../domain/usecase/send_email_verification_usecase.dart';
import '../../../domain/usecase/validate_email_verification_usecase.dart';
import '../../screen/login/login_screen.dart';

part 'account_cubit.freezed.dart';
part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit([this.param = const LoginScreenParam()])
      : super(const AccountState.accountInit()) {
    usernameController.text =
        kDebugMode ? dotenv.env['LOGIN_USERNAME'] ?? '' : '';
    profilePictureUrl = APIUrls.getCoverImage(
      getIt<SessionData>().user?.avatarUrl ?? "",
    );
    isFaceIdEnabled = getIt<SessionData>().user?.isFaceIdEnabled ?? false;
    isNotificationEnabled = getIt<SessionData>().user?.isNotifications ?? false;
    isEmailNotificationEnabled =
        getIt<SessionData>().user?.emailNotifications ?? false;
    isSmsNotificationEnabled =
        getIt<SessionData>().user?.smsNotifications ?? false;
    _shouldDeleteExistingImage = false;
  }

  // fields
  final LoginScreenParam param;

  ///form section
  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final usernameFocusNode = FocusNode();
  final usernameKey = GlobalKey<FormFieldState<String>>();

  bool _isNotificationEnabled = false;
  bool get isNotificationEnabled => _isNotificationEnabled;
  set isNotificationEnabled(bool value) {
    _isNotificationEnabled = value;
    emit(AccountState.notificationToggelled(value));
  }

  bool _isEmailNotificationEnabled = false;
  bool get isEmailNotificationEnabled => _isEmailNotificationEnabled;
  set isEmailNotificationEnabled(bool value) {
    _isEmailNotificationEnabled = value;
    emit(AccountState.emailNotificationToggelled(value));
  }

  bool _isSmsNotificationEnabled = false;
  bool get isSmsNotificationEnabled => _isSmsNotificationEnabled;
  set isSmsNotificationEnabled(bool value) {
    _isSmsNotificationEnabled = value;
    emit(AccountState.smsNotificationToggelled(value));
  }

  bool _isFaceIdEnabled = false;
  bool get isFaceIdEnabled => _isFaceIdEnabled;
  set isFaceIdEnabled(bool value) {
    _isFaceIdEnabled = value;
    emit(AccountState.faceidToggelled(value));
  }

  String _profilePictureUrl = "";
  String get profilePictureUrl => _profilePictureUrl;
  set profilePictureUrl(String value) {
    _profilePictureUrl = value;
    emit(AccountState.profilePictureUrl(value));
  }

  XFile? _profilePicture;
  XFile? get profilePicture => _profilePicture;
  set profilePicture(XFile? value) {
    _profilePicture = value;
    emit(AccountState.newProfilePicture(value));
  }

  bool isLoading = false;

  bool _shouldDeleteExistingImage = false;
  bool get shouldDeleteExistingImage => _shouldDeleteExistingImage;

  void setLoading(bool value) {
    isLoading = value;
    emit(state);
  }

  void login(LoginParam param) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<LoginUsecase>()(param);

    result.pick(
      onData: (data) async {
        isLoading = false;
        emit(AccountState.userLoginSuccess(param.email ?? ""));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => login(param)));
      },
    );
  }

  void resgister(ResgisterParam param) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<ResgisterUsecase>()(param);

    result.pick(
      onData: (data) async {
        // Set session data after successful registration
        getIt<SessionData>().user = data;
        await saveTokenAndRestart(data);

        // Send email verification OTP
        final emailVerificationResult =
            await getIt<SendEmailVerificationUsecase>()(
          SendEmailVerificationParam(membersId: data.id),
        );

        emailVerificationResult.pick(
          onData: (emailVerificationData) {
            // Email verification OTP sent successfully
            emit(AccountState.userRegisteredSuccess(data.copyWith(otp: "")));
          },
          onError: (error) {
            // Even if email verification fails, we still show success but with error
            emit(AccountState.userRegisteredSuccess(data.copyWith(otp: "")));
          },
        );
      },
      onError: (error) {
        emit(AccountState.registerError(error, () => resgister(param), param));
      },
    );
  }

  Future<String> showOtp(VerificationType type, ResgisterParam param) async {
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

    final completer = Completer<String>();

    result.pick(
      onData: (data) {
        completer.complete(data.otp);
      },
      onError: (error) {
        completer.complete(""); // Return empty string on error
      },
    );

    return completer.future;
  }

  void updateProfile(UpdateProfileParam param) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<UpdateProfileUsecase>().call(param);

    result.pick(
      onData: (data) {
        getIt<SessionData>().user = data;
        emit(const AccountState.profileUpdateSuccess());
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => updateProfile(param)));
      },
    );
  }

  void resendCode(ResendCodeParam param) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<ResendCodeUsecase>()(param);

    result.pick(
      onData: (data) {
        emit(AccountState.codeResentSuccess(data));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => resendCode(param)));
      },
    );
  }

  void resendEmailVerification() async {
    emit(const AccountState.accountLoading());

    final result = await getIt<SendEmailVerificationUsecase>()(
      SendEmailVerificationParam(membersId: getIt<SessionData>().user?.id ?? 0),
    );

    result.pick(
      onData: (data) {
        emit(
          AccountState.codeResentSuccess(
            SendOtpEntity(
              otp: "",
              type: VerificationType.email,
              id: getIt<SessionData>().user?.id ?? 0,
            ),
          ),
        );
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => resendEmailVerification()));
      },
    );
  }

  void verifyOtp(VerifyOtpParam param) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<VerifyOtpUsecase>()(param);

    result.pick(
      onData: (data) {
        emit(AccountState.accountVerifiedSuccess(data));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => verifyOtp(param)));
      },
    );
  }

  void validateEmailVerification(String otp) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<ValidateEmailVerificationUsecase>()(
      ValidateEmailVerificationParam(
        membersId: getIt<SessionData>().user?.id ?? 0,
        otp: otp,
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
            AccountState.accountVerifiedSuccess(
              ValidateOtpEntity(
                otpValid: data.otpValid,
                id: getIt<SessionData>().user?.id ?? 0,
              ),
            ),
          );
        } else {
          emit(
            AccountState.accountError(
              const AppErrors.customError(message: "Invalid OTP code"),
              () => validateEmailVerification(otp),
            ),
          );
        }
      },
      onError: (error) {
        emit(
          AccountState.accountError(
            error,
            () => validateEmailVerification(otp),
          ),
        );
      },
    );
  }

  void showDeleteAccount() {
    emit(const AccountState.showDeleteAccount());
  }

  void showDeleteData() {
    emit(const AccountState.showDeleteData());
  }

  void cancelDeleteData() {
    emit(const AccountState.accountInit());
  }

  void deleteAccount() async {
    emit(const AccountState.accountLoading());

    final result = await getIt<DeleteAccountUsecase>()(
      DeleteAccountParam(memberId: getIt<SessionData>().user?.id ?? 0),
    );

    result.pick(
      onData: (data) {
        Utils.logout();
        emit(const AccountState.accountInit());
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => deleteAccount()));
      },
    );
  }

  Future<void> saveTokenAndRestart(MemberInfoEntity loginResponse) async {
    await _persistUser(loginResponse);
  }

  void toggleFaceId() {
    isFaceIdEnabled = !isFaceIdEnabled;

    getIt<SessionData>().user = getIt<SessionData>().user?.copyWith(
          isFaceIdEnabled: isFaceIdEnabled,
        );

    // Save settings to backend
  }

  void toggleNotification() {
    isNotificationEnabled = !isNotificationEnabled;

    getIt<SessionData>().user = getIt<SessionData>().user?.copyWith(
          isNotifications: isNotificationEnabled,
        );

    // Save settings to backend
  }

  Future<void> _persistUser(MemberInfoEntity loginResponse) async {
    await _saveMemberId(loginResponse.id);
  }

  Future<void> _saveMemberId(int memberId) async {
    await LocalStorage.persistMemberId(memberId);
  }

  void deleteNewProfilePicture() {
    profilePicture = null;
    if (profilePictureUrl.isNotEmpty) {
      _shouldDeleteExistingImage = true;
      profilePictureUrl = "";
    }
  }

  void setNewProfilePicture(XFile? value) {
    profilePicture = value;
    _shouldDeleteExistingImage = false;
  }

  Future<void> uploadProfilePicture() async {}
}
