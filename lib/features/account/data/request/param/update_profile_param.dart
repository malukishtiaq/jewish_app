import 'package:jewish_app/core/common/extensions/string_extensions.dart';
import 'package:jewish_app/core/params/base_params.dart';

class UpdateProfileParam extends BaseParams {
  final int id;
  final String? socialFacebookId;
  final String? socialFacebookToken;
  final String? socialLinkedInId;
  final String? socialLinkedInToken;
  final String? socialGmailId;
  final String? socialAppleId;
  final String? countryCode;
  final String? country;
  final String? phoneNo;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? userName;
  final String? address;
  final String? city;
  final String? state;
  final String? zipCode;

  UpdateProfileParam({
    required this.id,
    this.socialFacebookId,
    this.socialFacebookToken,
    this.socialLinkedInId,
    this.socialLinkedInToken,
    this.socialGmailId,
    this.socialAppleId,
    this.countryCode,
    this.country,
    this.phoneNo,
    this.firstName,
    this.lastName,
    this.email,
    this.userName,
    this.address,
    this.city,
    this.state,
    this.zipCode,
  });

  @override
  Map<String, dynamic> toMap() => {
    'MembersId': id,
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
    if (countryCode.isNotEmptyNorNull) 'PhoneCountryCode': countryCode,
    if (country.isNotEmptyNorNull) 'Country': country,
    if (phoneNo.isNotEmptyNorNull) 'PhoneNo': phoneNo,
    if (firstName.isNotEmptyNorNull) 'FirstName': firstName,
    if (lastName.isNotEmptyNorNull) 'LastName': lastName,
    if (email.isNotEmptyNorNull) 'Email': email,
    if (userName.isNotEmptyNorNull) 'UserName': userName,
    if (address.isNotEmptyNorNull) 'Address': address,
    if (city.isNotEmptyNorNull) 'City': city,
    if (state.isNotEmptyNorNull) 'State': state,
    if (zipCode.isNotEmptyNorNull) 'ZipCode': zipCode,
  };
}
