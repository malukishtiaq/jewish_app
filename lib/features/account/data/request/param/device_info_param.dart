import 'package:jewish_app/core/common/extensions/string_extensions.dart';
import 'package:jewish_app/core/params/base_params.dart';

class DeviceInfoParam extends BaseParams {
  final int? id;
  final int? membersId;
  final String? devicePlatform;
  final String? deviceToken;
  final String? osVersion;
  final String? modelName;
  final String? appVersion;
  final String? deviceId;

  DeviceInfoParam({
    this.id,
    this.membersId,
    this.devicePlatform,
    this.deviceToken,
    this.osVersion,
    this.modelName,
    this.appVersion,
    this.deviceId,
  });

  @override
  Map<String, dynamic> toMap() => {
    if (id != null) "Id": id,
    if (membersId != null) "MembersId": membersId,
    if (devicePlatform.isNotEmptyNorNull) "DevicePlatform": devicePlatform,
    if (deviceToken.isNotEmptyNorNull) "DeviceToken": deviceToken,
    if (osVersion.isNotEmptyNorNull) "OSVersion": osVersion,
    if (modelName.isNotEmptyNorNull) "ModelName": modelName,
    if (appVersion.isNotEmptyNorNull) "AppVersion": appVersion,
    if (deviceId.isNotEmptyNorNull) "DeviceId": deviceId,
  };
}
