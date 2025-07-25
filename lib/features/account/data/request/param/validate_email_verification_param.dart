import 'package:jewish_app/core/common/extensions/string_extensions.dart';

import '../../../../../core/params/base_params.dart';

class ValidateEmailVerificationParam extends BaseParams {
  final int membersId;
  final String otp;
  final bool isEmail;
  final String email;

  ValidateEmailVerificationParam({
    required this.membersId,
    required this.otp,
    this.isEmail = true,
    this.email = "",
  });

  @override
  Map<String, dynamic> toMap() => {
    if (email.isEmpty) "MembersId": membersId,
    "Otp": otp,
    if (email.isEmpty) "IsEmail": isEmail,
    if (email.isNotEmptyNorNull) "Email": email,
  };
}
