// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:jewish_app/core/entities/base_entity.dart';

class ValidateOtpLoginEntity extends BaseEntity {
  final int membersId;
  final bool isAuthenticated;
  final String authenticatedOn;
  final String accessToken;
  final int invalidLogins;
  final bool isLockedOut;
  final String? lockedOutExpiresOn;
  final int httpErrorCode;
  final String httpErrorMessage;

  ValidateOtpLoginEntity({
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

  @override
  List<Object?> get props => [
    membersId,
    isAuthenticated,
    authenticatedOn,
    accessToken,
    invalidLogins,
    isLockedOut,
    lockedOutExpiresOn,
    httpErrorCode,
    httpErrorMessage,
  ];

  ValidateOtpLoginEntity copyWith({
    int? membersId,
    bool? isAuthenticated,
    String? authenticatedOn,
    String? accessToken,
    int? invalidLogins,
    bool? isLockedOut,
    String? lockedOutExpiresOn,
    int? httpErrorCode,
    String? httpErrorMessage,
  }) {
    return ValidateOtpLoginEntity(
      membersId: membersId ?? this.membersId,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      authenticatedOn: authenticatedOn ?? this.authenticatedOn,
      accessToken: accessToken ?? this.accessToken,
      invalidLogins: invalidLogins ?? this.invalidLogins,
      isLockedOut: isLockedOut ?? this.isLockedOut,
      lockedOutExpiresOn: lockedOutExpiresOn ?? this.lockedOutExpiresOn,
      httpErrorCode: httpErrorCode ?? this.httpErrorCode,
      httpErrorMessage: httpErrorMessage ?? this.httpErrorMessage,
    );
  }

  @override
  String toString() =>
      'ValidateOtpLoginEntity(membersId: $membersId, isAuthenticated: $isAuthenticated, authenticatedOn: $authenticatedOn, accessToken: $accessToken, invalidLogins: $invalidLogins, isLockedOut: $isLockedOut, lockedOutExpiresOn: $lockedOutExpiresOn, httpErrorCode: $httpErrorCode, httpErrorMessage: $httpErrorMessage)';

  @override
  bool operator ==(covariant ValidateOtpLoginEntity other) {
    if (identical(this, other)) return true;

    return other.membersId == membersId &&
        other.isAuthenticated == isAuthenticated &&
        other.authenticatedOn == authenticatedOn &&
        other.accessToken == accessToken &&
        other.invalidLogins == invalidLogins &&
        other.isLockedOut == isLockedOut &&
        other.lockedOutExpiresOn == lockedOutExpiresOn &&
        other.httpErrorCode == httpErrorCode &&
        other.httpErrorMessage == httpErrorMessage;
  }

  @override
  int get hashCode =>
      membersId.hashCode ^
      isAuthenticated.hashCode ^
      authenticatedOn.hashCode ^
      accessToken.hashCode ^
      invalidLogins.hashCode ^
      isLockedOut.hashCode ^
      lockedOutExpiresOn.hashCode ^
      httpErrorCode.hashCode ^
      httpErrorMessage.hashCode;
}
