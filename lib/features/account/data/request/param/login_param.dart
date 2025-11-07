import 'package:jewish_app/core/common/extensions/string_extensions.dart';

import '../../../../../core/params/base_params.dart';

class LoginParam extends BaseParams {
  final String? email;
  final String? password;
  final String? socialGmailId;
  final String? socialFacebookId;
  final String? socialFacebookToken;
  final String? socialLinkedInId;
  final String? socialLinkedInToken;
  final String? socialAppleId;

  LoginParam({
    this.email,
    this.password,
    this.socialGmailId,
    this.socialFacebookId,
    this.socialFacebookToken,
    this.socialLinkedInId,
    this.socialLinkedInToken,
    this.socialAppleId,
  });

  @override
  Map<String, dynamic> toMap() => {
        "AppName": "DbTanach",
        if (email.isNotEmptyNorNull) "Email": email,
        if (password.isNotEmptyNorNull) "Password": password,
        "SocialGmailId": socialGmailId ?? "",
        "SocialFacebookId": socialFacebookId ?? "",
        "SocialFacebookToken": socialFacebookToken ?? "",
        "SocialLinkedInId": socialLinkedInId ?? "",
        "SocialLinkedInToken": socialLinkedInToken ?? "",
        "SocialAppleId": socialAppleId ?? "",
      };
}
