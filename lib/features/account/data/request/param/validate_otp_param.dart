import '../../../../../core/params/base_params.dart';

class ValidateOtpParam extends BaseParams {
  final int id;
  final String otp;

  ValidateOtpParam({
    required this.id,
    required this.otp,
  });

  @override
  Map<String, dynamic> toMap() => {
        "Id": id,
        "Otp": otp,
      };
}

