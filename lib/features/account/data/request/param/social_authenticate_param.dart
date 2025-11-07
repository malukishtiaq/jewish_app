import '../../../../../core/common/extensions/string_extensions.dart';
import '../../../../../core/params/base_params.dart';

class SocialAuthenticateParam extends BaseParams {
  final String email;
  final String? password;
  final String? name;
  final String? phoneNo;
  final String? phoneCountryCode;
  final String? country;
  final String? socialFacebookId;
  final String? socialFacebookToken;
  final String? socialLinkedInId;
  final String? socialLinkedInToken;
  final String? socialGmailId;
  final String? socialAppleId;

  SocialAuthenticateParam({
    required this.email,
    this.password,
    this.name,
    this.phoneNo,
    this.phoneCountryCode,
    this.country,
    this.socialFacebookId,
    this.socialFacebookToken,
    this.socialLinkedInId,
    this.socialLinkedInToken,
    this.socialGmailId,
    this.socialAppleId,
  });

  @override
  Map<String, dynamic> toMap() => {
        "AppName": "DbTanach",
        "Email": email,
        if (password.isNotEmptyNorNull) "Password": password,
        if (name.isNotEmptyNorNull) "Name": name,
        if (country.isNotEmptyNorNull) "Country": country,
        if (phoneCountryCode.isNotEmptyNorNull)
          "PhoneCountryCode": phoneCountryCode,
        if (phoneNo.isNotEmptyNorNull) "PhoneNo": phoneNo,
        if (socialFacebookId.isNotEmptyNorNull)
          "SocialFacebookId": socialFacebookId,
        if (socialFacebookToken.isNotEmptyNorNull)
          "SocialFacebookToken": socialFacebookToken,
        if (socialLinkedInId.isNotEmptyNorNull)
          "SocialLinkedInId": socialLinkedInId,
        if (socialLinkedInToken.isNotEmptyNorNull)
          "SocialLinkedInToken": socialLinkedInToken,
        if (socialGmailId.isNotEmptyNorNull) "SocialGmailId": socialGmailId,
        if (socialAppleId.isNotEmptyNorNull) "SocialAppleId": socialAppleId,
      };
}

