import 'package:jewish_app/core/common/extensions/string_extensions.dart';
import 'package:jewish_app/core/params/base_params.dart';

class UpdateProfileParam extends BaseParams {
  final int id;
  final String? name;
  final String? socialFacebookId;
  final String? socialFacebookToken;
  final String? socialLinkedInId;
  final String? socialLinkedInToken;
  final String? socialGmailId;
  final String? socialAppleId;
  final String? phoneCountryCode;
  final String? country;
  final String? countryCode;
  final String? phoneNo;

  UpdateProfileParam({
    required this.id,
    this.name,
    this.socialFacebookId,
    this.socialFacebookToken,
    this.socialLinkedInId,
    this.socialLinkedInToken,
    this.socialGmailId,
    this.socialAppleId,
    this.phoneCountryCode,
    this.country,
    this.countryCode,
    this.phoneNo,
  });

  @override
  Map<String, dynamic> toMap() => {
    'Id': id,
    if (name.isNotEmptyNorNull) 'Name': name,
    if (socialFacebookId.isNotEmptyNorNull)
      'SocialFacebookId': socialFacebookId,
    if (socialFacebookToken.isNotEmptyNorNull)
      'SocialFacebookToken': socialFacebookToken,
    if (socialLinkedInId.isNotEmptyNorNull)
      'SocialLinkedInId': socialLinkedInId,
    if (socialLinkedInToken.isNotEmptyNorNull)
      'SocialLinkedInToken': socialLinkedInToken,
    if (socialGmailId.isNotEmptyNorNull) 'SocialGmailId': socialGmailId,
    if (socialAppleId.isNotEmptyNorNull) 'SocialAppleId': socialAppleId,
    if (phoneCountryCode.isNotEmptyNorNull) 'PhoneCountryCode': phoneCountryCode,
    if (country.isNotEmptyNorNull) 'Country': country,
    if (countryCode.isNotEmptyNorNull) 'CountryCode': countryCode,
    if (phoneNo.isNotEmptyNorNull) 'PhoneNo': phoneNo,
  };
}
