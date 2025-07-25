import 'package:jewish_app/core/common/extensions/string_extensions.dart';
import 'package:jewish_app/core/params/base_params.dart';

class ResendCodeParam extends BaseParams {
  final String? phoneNo;
  final String? email;
  final String? phoneCountryCode;

  ResendCodeParam({this.phoneNo, this.email, this.phoneCountryCode});

  @override
  Map<String, dynamic> toMap() => {
    if (phoneNo.isNotEmptyNorNull) "PhoneNo": phoneNo,
    if (email.isNotEmptyNorNull) "Email": email,
    if (phoneCountryCode.isNotEmptyNorNull)
      "PhoneCountryCode": phoneCountryCode,
  };
}
