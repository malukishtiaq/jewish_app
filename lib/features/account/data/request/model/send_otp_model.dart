import 'package:jewish_app/core/models/base_model.dart';
import 'package:jewish_app/features/account/domain/entity/send_otp_entity.dart';

import '../../../../../core/common/type_validators.dart';

class SendOtpModel extends BaseModel<SendOtpEntity> {
  final bool isExists;
  final int membersId;
  final String oneTimePassword;

  SendOtpModel({
    required this.isExists,
    required this.membersId,
    required this.oneTimePassword,
  });

  @override
  SendOtpEntity toEntity() {
    return SendOtpEntity(
      isExists: isExists,
      membersId: membersId,
      oneTimePassword: oneTimePassword,
    );
  }

  factory SendOtpModel.fromMap(Map<String, dynamic> map) {
    // API returns: { "OneTimePass": { "IsExists": true, "MembersId": 123, "OneTimePassword": "123456" } }
    final oneTimePass = map['OneTimePass'] as Map<String, dynamic>;
    return SendOtpModel(
      isExists: boolV(oneTimePass['IsExists']),
      membersId: numV(oneTimePass['MembersId']) ?? 0,
      oneTimePassword: stringV(oneTimePass['OneTimePassword']),
    );
  }
}
