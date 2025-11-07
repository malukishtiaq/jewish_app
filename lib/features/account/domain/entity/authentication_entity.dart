import 'package:jewish_app/core/entities/base_entity.dart';

class AuthenticationEntity extends BaseEntity {
  final int id;
  final bool isAuthenticated;
  final String authenticatedOn;
  final String accessToken;
  final int invalidLogins;
  final bool isLockedOut;
  final String lockedOutExpiresOn;
  final String fileGuid;
  final int httpErrorCode;
  final String httpErrorMessage;

  AuthenticationEntity({
    required this.id,
    required this.isAuthenticated,
    required this.authenticatedOn,
    required this.accessToken,
    required this.invalidLogins,
    required this.isLockedOut,
    required this.lockedOutExpiresOn,
    required this.fileGuid,
    required this.httpErrorCode,
    required this.httpErrorMessage,
  });

  @override
  List<Object?> get props => [
        id,
        isAuthenticated,
        authenticatedOn,
        accessToken,
        invalidLogins,
        isLockedOut,
        lockedOutExpiresOn,
        fileGuid,
        httpErrorCode,
        httpErrorMessage,
      ];
}

