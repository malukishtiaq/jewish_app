import 'package:jewish_app/core/models/base_model.dart';
import 'package:jewish_app/features/account/domain/entity/member_device_info_entity.dart';

class MemberDeviceInfoModel extends BaseModel<MemberDeviceInfoEntity> {
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

  MemberDeviceInfoModel({
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

  factory MemberDeviceInfoModel.fromMap(Map<String, dynamic> map) {
    return MemberDeviceInfoModel(
      id: map['Id'] as int?,
      isDeleted: map['IsDeleted'] as bool?,
      changedOn: map['ChangedOn'] as String?,
      tokensIdChangedBy: map['TokensId_ChangedBy'] as int?,
      membersId: map['MembersId'] as int?,
      devicePlatform: map['DevicePlatform'] as String?,
      deviceToken: map['DeviceToken'] as String?,
      osVersion: map['OSVersion'] as String?,
      modelName: map['ModelName'] as String?,
      appVersion: map['AppVersion'] as String?,
      deviceId: map['DeviceId'] as String?,
    );
  }

  @override
  MemberDeviceInfoEntity toEntity() {
    return MemberDeviceInfoEntity(
      id: id,
      isDeleted: isDeleted,
      changedOn: changedOn,
      tokensIdChangedBy: tokensIdChangedBy,
      membersId: membersId,
      devicePlatform: devicePlatform,
      deviceToken: deviceToken,
      osVersion: osVersion,
      modelName: modelName,
      appVersion: appVersion,
      deviceId: deviceId,
    );
  }
}
