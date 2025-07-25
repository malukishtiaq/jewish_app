import 'package:jewish_app/core/entities/base_entity.dart';

class MemberDeviceInfoEntity extends BaseEntity {
  final int? id;
  final bool? isDeleted;
  final String? changedOn;
  final int? tokensIdChangedBy;
  final int? membersId;
  final String? devicePlatform;
  final String? deviceToken;
  final String? osVersion;
  final String? modelName;
  final String? appVersion;
  final String? deviceId;
  MemberDeviceInfoEntity({
    this.id,
    this.isDeleted,
    this.changedOn,
    this.tokensIdChangedBy,
    this.membersId,
    this.devicePlatform,
    this.deviceToken,
    this.osVersion,
    this.modelName,
    this.appVersion,
    this.deviceId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    isDeleted,
    changedOn,
    tokensIdChangedBy,
    membersId,
    devicePlatform,
    deviceToken,
    osVersion,
    modelName,
    appVersion,
    deviceId,
  ];

  MemberDeviceInfoEntity copyWith({
    int? id,
    bool? isDeleted,
    String? changedOn,
    int? tokensIdChangedBy,
    int? membersId,
    String? devicePlatform,
    String? deviceToken,
    String? osVersion,
    String? modelName,
    String? appVersion,
    String? deviceId,
  }) {
    return MemberDeviceInfoEntity(
      id: id ?? this.id,
      isDeleted: isDeleted ?? this.isDeleted,
      changedOn: changedOn ?? this.changedOn,
      tokensIdChangedBy: tokensIdChangedBy ?? this.tokensIdChangedBy,
      membersId: membersId ?? this.membersId,
      devicePlatform: devicePlatform ?? this.devicePlatform,
      deviceToken: deviceToken ?? this.deviceToken,
      osVersion: osVersion ?? this.osVersion,
      modelName: modelName ?? this.modelName,
      appVersion: appVersion ?? this.appVersion,
      deviceId: deviceId ?? this.deviceId,
    );
  }

  @override
  String toString() {
    return 'MemberDeviceInfoEntity(id: $id, isDeleted: $isDeleted, changedOn: $changedOn, tokensIdChangedBy: $tokensIdChangedBy, membersId: $membersId, devicePlatform: $devicePlatform, deviceToken: $deviceToken, osVersion: $osVersion, modelName: $modelName, appVersion: $appVersion, deviceId: $deviceId)';
  }
}
