import 'package:jewish_app/core/common/type_validators.dart';
import 'package:jewish_app/core/models/base_model.dart';
import 'package:jewish_app/features/account/domain/entity/validate_otp_login_entity.dart';

class ValidateOtpLoginModel extends BaseModel<ValidateOtpLoginEntity> {
  final int membersId;
  final bool isAuthenticated;
  final String authenticatedOn;
  final String accessToken;
  final int invalidLogins;
  final bool isLockedOut;
  final String? lockedOutExpiresOn;
  final int httpErrorCode;
  final String httpErrorMessage;

  ValidateOtpLoginModel({
    required this.membersId,
    required this.isAuthenticated,
    required this.authenticatedOn,
    required this.accessToken,
    required this.invalidLogins,
    required this.isLockedOut,
    this.lockedOutExpiresOn,
    required this.httpErrorCode,
    required this.httpErrorMessage,
  });

  factory ValidateOtpLoginModel.fromMap(Map<String, dynamic> map) {
    return ValidateOtpLoginModel(
      membersId: numV(map['MembersId']) ?? 0,
      isAuthenticated: boolV(map['IsAuthenticated']) ?? false,
      authenticatedOn: stringV(map['AuthenticatedOn']),
      accessToken: stringV(map['AccessToken']),
      invalidLogins: numV(map['InvalidLogins']) ?? 0,
      isLockedOut: boolV(map['IsLockedOut']) ?? false,
      lockedOutExpiresOn: stringV(map['LockedOutExpiresOn']),
      httpErrorCode: numV(map['HttpErrorCode']) ?? 0,
      httpErrorMessage: stringV(map['HttpErrorMessage']),
    );
  }

  factory ValidateOtpLoginModel.fromAuthenticationMap(
    Map<String, dynamic> map,
  ) {
    final authentication = map['Authentication'] as Map<String, dynamic>? ?? {};
    return ValidateOtpLoginModel.fromMap(authentication);
  }

  @override
  ValidateOtpLoginEntity toEntity() {
    return ValidateOtpLoginEntity(
      membersId: membersId,
      isAuthenticated: isAuthenticated,
      authenticatedOn: authenticatedOn,
      accessToken: accessToken,
      invalidLogins: invalidLogins,
      isLockedOut: isLockedOut,
      lockedOutExpiresOn: lockedOutExpiresOn,
      httpErrorCode: httpErrorCode,
      httpErrorMessage: httpErrorMessage,
    );
  }
}
