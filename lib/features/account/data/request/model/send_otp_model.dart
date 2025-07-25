import 'package:jewish_app/core/models/base_model.dart';
import 'package:jewish_app/features/account/domain/entity/send_otp_entity.dart';

import '../../../../../core/common/type_validators.dart';

class SendOtpModel extends BaseModel<SendOtpEntity> {
  final String otp;
  final int id;
  SendOtpModel({required this.otp, required this.id});

  @override
  SendOtpEntity toEntity() {
    return SendOtpEntity(otp: otp, id: id);
  }

  factory SendOtpModel.fromMap(Map<String, dynamic> map) {
    return SendOtpModel(otp: stringV(map['Otp']), id: numV(map['Id']) ?? 0);
  }
}
