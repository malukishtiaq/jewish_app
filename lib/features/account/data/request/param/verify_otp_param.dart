import '../../../../../core/params/base_params.dart';

class VerifyOtpParam extends BaseParams {
  final String code;
  final String? phoneCountryCode;
  final String? phoneNo;
  final String? email;

  VerifyOtpParam({
    required this.code,
    this.phoneCountryCode,
    this.phoneNo,
    this.email,
  });

  @override
  Map<String, dynamic> toMap() => {
        "Otp": code,
        "PhoneCountryCode": phoneCountryCode,
        "PhoneNo": phoneNo,
        "Email": email,
      };
}
