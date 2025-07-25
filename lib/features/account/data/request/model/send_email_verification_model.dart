import 'package:jewish_app/core/common/type_validators.dart';
import 'package:jewish_app/core/models/base_model.dart';
import 'package:jewish_app/features/account/domain/entity/send_email_verification_entity.dart';

class SendEmailVerificationModel
    extends BaseModel<SendEmailVerificationEntity> {
  final String status;

  SendEmailVerificationModel({required this.status});

  factory SendEmailVerificationModel.fromMap(Map<String, dynamic> map) {
    return SendEmailVerificationModel(status: stringV(map['Status']));
  }

  @override
  SendEmailVerificationEntity toEntity() {
    return SendEmailVerificationEntity(status: status);
  }
}
