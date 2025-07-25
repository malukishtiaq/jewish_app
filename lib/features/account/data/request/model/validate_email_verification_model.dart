import 'package:jewish_app/core/common/type_validators.dart';
import 'package:jewish_app/core/models/base_model.dart';
import 'package:jewish_app/features/account/domain/entity/validate_email_verification_entity.dart';

class ValidateEmailVerificationModel
    extends BaseModel<ValidateEmailVerificationEntity> {
  final String otpValid;

  ValidateEmailVerificationModel({required this.otpValid});

  factory ValidateEmailVerificationModel.fromMap(Map<String, dynamic> map) {
    return ValidateEmailVerificationModel(otpValid: stringV(map['OtpValid']));
  }

  @override
  ValidateEmailVerificationEntity toEntity() {
    return ValidateEmailVerificationEntity(otpValid: otpValid);
  }
}
