import 'package:jewish_app/core/common/type_validators.dart';
import 'package:jewish_app/core/models/base_model.dart';
import 'package:jewish_app/features/account/domain/entity/validate_otp_entity.dart';

class ValidateOtpModel extends BaseModel<ValidateOtpEntity> {
  final String otpValid;
  final int id;

  ValidateOtpModel({required this.otpValid, required this.id});

  factory ValidateOtpModel.fromMap(Map<String, dynamic> map) {
    return ValidateOtpModel(
      otpValid: stringV(map['OtpValid']),
      id: numV(map['Id']) ?? 0,
    );
  }

  @override
  ValidateOtpEntity toEntity() {
    return ValidateOtpEntity(otpValid: otpValid, id: id);
  }
}
