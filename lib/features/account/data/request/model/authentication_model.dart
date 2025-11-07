import 'dart:convert';

import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/authentication_entity.dart';

class AuthenticationModel extends BaseModel<AuthenticationEntity> {
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

  AuthenticationModel({
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

  factory AuthenticationModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) return throw Exception('Map is null');

    return AuthenticationModel(
      id: numV(map['Id']) ?? 0,
      isAuthenticated: boolV(map['IsAuthenticated']),
      authenticatedOn: stringV(map['AuthenticatedOn']),
      accessToken: stringV(map['AccessToken']),
      invalidLogins: numV(map['InvalidLogins']) ?? 0,
      isLockedOut: boolV(map['IsLockedOut']),
      lockedOutExpiresOn: stringV(map['LockedOutExpiresOn']),
      fileGuid: stringV(map['FileGuid']),
      httpErrorCode: numV(map['HttpErrorCode']) ?? 0,
      httpErrorMessage: stringV(map['HttpErrorMessage']),
    );
  }

  factory AuthenticationModel.fromJson(String source) =>
      AuthenticationModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'IsAuthenticated': isAuthenticated,
      'AuthenticatedOn': authenticatedOn,
      'AccessToken': accessToken,
      'InvalidLogins': invalidLogins,
      'IsLockedOut': isLockedOut,
      'LockedOutExpiresOn': lockedOutExpiresOn,
      'FileGuid': fileGuid,
      'HttpErrorCode': httpErrorCode,
      'HttpErrorMessage': httpErrorMessage,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  AuthenticationEntity toEntity() => AuthenticationEntity(
        id: id,
        isAuthenticated: isAuthenticated,
        authenticatedOn: authenticatedOn,
        accessToken: accessToken,
        invalidLogins: invalidLogins,
        isLockedOut: isLockedOut,
        lockedOutExpiresOn: lockedOutExpiresOn,
        fileGuid: fileGuid,
        httpErrorCode: httpErrorCode,
        httpErrorMessage: httpErrorMessage,
      );
}

