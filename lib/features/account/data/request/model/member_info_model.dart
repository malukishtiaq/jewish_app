import 'dart:convert';
import 'package:jewish_app/core/common/type_validators.dart';
import 'package:jewish_app/core/models/base_model.dart';
import 'package:jewish_app/features/account/domain/entity/member_info_entity.dart';

class MemberInfoModel extends BaseModel<MemberInfoEntity> {
  final int id;
  final bool isDeleted;
  final DateTime changedOn;
  final int tokensIdChangedBy;
  final int tokensId;
  final String metasGuid;
  final String userName;
  final String firstName;
  final String lastName;
  final String phoneNo;
  final bool isPhoneVerified;
  final String country;
  final String phoneCountryCode;
  final String email;
  final bool isEmailVerified;
  final int filesIdAvatar;
  final String socialFacebookId;
  final String socialFacebookToken;
  final String socialLinkedInId;
  final String socialLinkedInToken;
  final String socialGmailId;
  final String socialAppleId;
  final bool isNotifications;
  final bool isFaceIdEnabled;
  final String avatarUrl;
  final String fullName;
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final bool pushNotifications;
  final bool emailNotifications;
  final bool smsNotifications;
  final int wonAuctionsId;
  final String wonUrlImageAuctions;
  final DateTime wonChangedOn;
  final double wonMemberBonus;
  final int wonItemsId;
  final String wonNameItems;
  final String wonUrlImageItems;
  final String wonShippingCompany;
  final int aucAuctionsId;
  final String aucUrlImage;
  final double aucMemberTotalAmount;
  final double aucMemberBidAmount;
  final double aucHighestAmountBid;
  final DateTime aucExpiresOn;
  final double aucMemberBonus;
  final String otpForgotPassword;
  final bool isBlocked;
  final int auctionsWin;
  final int myPoints;
  final int totalAuctions;

  MemberInfoModel({
    required this.id,
    required this.isDeleted,
    required this.changedOn,
    required this.tokensIdChangedBy,
    required this.tokensId,
    required this.metasGuid,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.phoneNo,
    required this.isPhoneVerified,
    required this.country,
    required this.phoneCountryCode,
    required this.email,
    required this.isEmailVerified,
    required this.filesIdAvatar,
    required this.socialFacebookId,
    required this.socialFacebookToken,
    required this.socialLinkedInId,
    required this.socialLinkedInToken,
    required this.socialGmailId,
    required this.socialAppleId,
    required this.isNotifications,
    required this.isFaceIdEnabled,
    required this.avatarUrl,
    required this.fullName,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.pushNotifications,
    required this.emailNotifications,
    required this.smsNotifications,
    required this.wonAuctionsId,
    required this.wonUrlImageAuctions,
    required this.wonChangedOn,
    required this.wonMemberBonus,
    required this.wonItemsId,
    required this.wonNameItems,
    required this.wonUrlImageItems,
    required this.wonShippingCompany,
    required this.aucAuctionsId,
    required this.aucUrlImage,
    required this.aucMemberTotalAmount,
    required this.aucMemberBidAmount,
    required this.aucHighestAmountBid,
    required this.aucExpiresOn,
    required this.aucMemberBonus,
    required this.otpForgotPassword,
    required this.isBlocked,
    required this.auctionsWin,
    required this.myPoints,
    required this.totalAuctions,
  });

  factory MemberInfoModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return MemberInfoModel(
        id: 0,
        isDeleted: false,
        changedOn: DateTime.now(),
        tokensIdChangedBy: 0,
        tokensId: 0,
        metasGuid: '',
        userName: '',
        firstName: '',
        lastName: '',
        phoneNo: '',
        isPhoneVerified: false,
        country: '',
        phoneCountryCode: '',
        email: '',
        isEmailVerified: false,
        filesIdAvatar: 0,
        socialFacebookId: '',
        socialFacebookToken: '',
        socialLinkedInId: '',
        socialLinkedInToken: '',
        socialGmailId: '',
        socialAppleId: '',
        isNotifications: false,
        isFaceIdEnabled: false,
        avatarUrl: '',
        fullName: '',
        address: '',
        city: '',
        state: '',
        zipCode: '',
        pushNotifications: false,
        emailNotifications: false,
        smsNotifications: false,
        wonAuctionsId: 0,
        wonUrlImageAuctions: '',
        wonChangedOn: DateTime.now(),
        wonMemberBonus: 0.0,
        wonItemsId: 0,
        wonNameItems: '',
        wonUrlImageItems: '',
        wonShippingCompany: '',
        aucAuctionsId: 0,
        aucUrlImage: '',
        aucMemberTotalAmount: 0.0,
        aucMemberBidAmount: 0.0,
        aucHighestAmountBid: 0.0,
        aucExpiresOn: DateTime.now(),
        aucMemberBonus: 0.0,
        otpForgotPassword: '',
        isBlocked: false,
        auctionsWin: 0,
        myPoints: 0,
        totalAuctions: 0,
      );
    }

    final model = MemberInfoModel(
      id: numV(map["Id"]) ?? 0,
      isDeleted: boolV(map["IsDeleted"]),
      changedOn: dateTimeV(map["ChangedOn"]) ?? DateTime.now(),
      tokensIdChangedBy: numV(map["TokensId_ChangedBy"]) ?? 0,
      tokensId: numV(map["TokensId"]) ?? 0,
      metasGuid: stringV(map["MetasGuid"]),
      userName: stringV(map["UserName"]),
      firstName: stringV(map["FirstName"]),
      lastName: stringV(map["LastName"]),
      phoneNo: stringV(map["PhoneNo"]),
      isPhoneVerified: boolV(map["IsPhoneVerified"]),
      country: stringV(map["Country"]),
      phoneCountryCode: stringV(map["PhoneCountryCode"]),
      email: stringV(map["Email"]),
      isEmailVerified: boolV(map["IsEmailVerified"]),
      filesIdAvatar: numV(map["FilesId_Avatar"]) ?? 0,
      socialFacebookId: stringV(map["SocialFacebookId"]),
      socialFacebookToken: stringV(map["SocialFacebookToken"]),
      socialLinkedInId: stringV(map["SocialLinkedInId"]),
      socialLinkedInToken: stringV(map["SocialLinkedInToken"]),
      socialGmailId: stringV(map["SocialGmailId"]),
      socialAppleId: stringV(map["SocialAppleId"]),
      isNotifications: boolV(map["IsNotifications"]),
      isFaceIdEnabled: boolV(map["IsFaceIdEnabled"]),
      avatarUrl: stringV(map["AvatarUrl"]),
      fullName: stringV(map["FullName"]),
      address: stringV(map["Address"]),
      city: stringV(map["City"]),
      state: stringV(map["State"]),
      zipCode: stringV(map["ZipCode"]),
      pushNotifications: boolV(map["PushNotifications"]),
      emailNotifications: boolV(map["EmailNotifications"]),
      smsNotifications: boolV(map["SmsNotifications"]),
      wonAuctionsId: numV(map["WonAuctionsId"]) ?? 0,
      wonUrlImageAuctions: stringV(map["WonUrlImageAuctions"]),
      wonChangedOn: dateTimeV(map["WonChangedOn"]) ?? DateTime.now(),
      wonMemberBonus: numV(map["WonMemberBonus"]) ?? 0.0,
      wonItemsId: numV(map["WonItemsId"]) ?? 0,
      wonNameItems: stringV(map["WonNameItems"]),
      wonUrlImageItems: stringV(map["WonUrlImageItems"]),
      wonShippingCompany: stringV(map["WonShippingCompany"]),
      aucAuctionsId: numV(map["AucAuctionsId"]) ?? 0,
      aucUrlImage: stringV(map["AucUrlImage"]),
      aucMemberTotalAmount: numV(map["AucMemberTotalAmount"]) ?? 0.0,
      aucMemberBidAmount: numV(map["AucMemberBidAmount"]) ?? 0.0,
      aucHighestAmountBid: numV(map["AucHighestAmountBid"]) ?? 0.0,
      aucExpiresOn: dateTimeV(map["AucExpiresOn"]) ?? DateTime.now(),
      aucMemberBonus: numV(map["AucMemberBonus"]) ?? 0.0,
      otpForgotPassword: stringV(map["OtpForgotPassword"]),
      isBlocked: boolV(map["IsBlocked"]),
      auctionsWin: numV(map["AuctionsWin"]) ?? 0,
      myPoints: numV(map["MyPoints"]) ?? 0,
      totalAuctions: numV(map["TotalAuctions"]) ?? 0,
    );

    return model;
  }

  factory MemberInfoModel.fromJson(String source) =>
      MemberInfoModel.fromMap(json.decode(source));

  @override
  MemberInfoEntity toEntity() => MemberInfoEntity(
    id: id,
    isDeleted: isDeleted,
    changedOn: changedOn,
    tokensIdChangedBy: tokensIdChangedBy,
    tokensId: tokensId,
    metasGuid: metasGuid,
    userName: userName,
    firstName: firstName,
    lastName: lastName,
    phoneNo: phoneNo,
    isPhoneVerified: isPhoneVerified,
    country: country,
    phoneCountryCode: phoneCountryCode,
    email: email,
    isEmailVerified: isEmailVerified,
    filesIdAvatar: filesIdAvatar,
    socialFacebookId: socialFacebookId,
    socialFacebookToken: socialFacebookToken,
    socialLinkedInId: socialLinkedInId,
    socialLinkedInToken: socialLinkedInToken,
    socialGmailId: socialGmailId,
    socialAppleId: socialAppleId,
    isNotifications: isNotifications,
    isFaceIdEnabled: isFaceIdEnabled,
    avatarUrl: avatarUrl,
    fullName: fullName,
    address: address,
    city: city,
    state: state,
    zipCode: zipCode,
    pushNotifications: pushNotifications,
    emailNotifications: emailNotifications,
    smsNotifications: smsNotifications,
    wonAuctionsId: wonAuctionsId,
    wonUrlImageAuctions: wonUrlImageAuctions,
    wonChangedOn: wonChangedOn,
    wonMemberBonus: wonMemberBonus,
    wonItemsId: wonItemsId,
    wonNameItems: wonNameItems,
    wonUrlImageItems: wonUrlImageItems,
    wonShippingCompany: wonShippingCompany,
    aucAuctionsId: aucAuctionsId,
    aucUrlImage: aucUrlImage,
    aucMemberTotalAmount: aucMemberTotalAmount,
    aucMemberBidAmount: aucMemberBidAmount,
    aucHighestAmountBid: aucHighestAmountBid,
    aucExpiresOn: aucExpiresOn,
    aucMemberBonus: aucMemberBonus,
    otpForgotPassword: otpForgotPassword,
    isBlocked: isBlocked,
    auctionsWin: auctionsWin,
    myPoints: myPoints,
    totalAuctions: totalAuctions,
  );
}
