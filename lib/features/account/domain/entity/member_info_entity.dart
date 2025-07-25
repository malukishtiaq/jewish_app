// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/entities/base_entity.dart';

class MemberInfoEntity extends BaseEntity {
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
  final String otp;

  MemberInfoEntity({
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
    this.otp = '',
  });

  @override
  String toString() => """ProfileEntity(
  id: $id,
  isDeleted: $isDeleted,
  changedOn: $changedOn,
  tokensIdChangedBy: $tokensIdChangedBy,
  tokensId: $tokensId,
  metasGuid: $metasGuid,
  userName: $userName,
  firstName: $firstName,
  lastName: $lastName,
  phoneNo: $phoneNo,
  isPhoneVerified: $isPhoneVerified,
  country: $country,
  phoneCountryCode: $phoneCountryCode,
  email: $email,
  isEmailVerified: $isEmailVerified,
  filesIdAvatar: $filesIdAvatar,
  socialFacebookId: $socialFacebookId,
  socialFacebookToken: $socialFacebookToken,
  socialLinkedInId: $socialLinkedInId,
  socialLinkedInToken: $socialLinkedInToken,
  socialGmailId: $socialGmailId,
  socialAppleId: $socialAppleId,
  isNotifications: $isNotifications,
  isFaceIdEnabled: $isFaceIdEnabled,
  avatarUrl: $avatarUrl,
  fullName: $fullName,
  address: $address,
  city: $city,
  state: $state,
  zipCode: $zipCode,
  pushNotifications: $pushNotifications,
  emailNotifications: $emailNotifications,
  smsNotifications: $smsNotifications,
  wonAuctionsId: $wonAuctionsId,
  wonUrlImageAuctions: $wonUrlImageAuctions,
  wonChangedOn: $wonChangedOn,
  wonMemberBonus: $wonMemberBonus,
  wonItemsId: $wonItemsId,
  wonNameItems: $wonNameItems,
  wonUrlImageItems: $wonUrlImageItems,
  wonShippingCompany: $wonShippingCompany,
  aucAuctionsId: $aucAuctionsId,
  aucUrlImage: $aucUrlImage,
  aucMemberTotalAmount: $aucMemberTotalAmount,
  aucMemberBidAmount: $aucMemberBidAmount,
  aucHighestAmountBid: $aucHighestAmountBid,
  aucExpiresOn: $aucExpiresOn,
  aucMemberBonus: $aucMemberBonus,
  otpForgotPassword: $otpForgotPassword,
  isBlocked: $isBlocked,
  auctionsWin: $auctionsWin,
  myPoints: $myPoints,
  totalAuctions: $totalAuctions,
  otp: $otp,
)""";

  MemberInfoEntity copyWith({
    int? id,
    bool? isDeleted,
    DateTime? changedOn,
    int? tokensIdChangedBy,
    int? tokensId,
    String? metasGuid,
    String? userName,
    String? firstName,
    String? lastName,
    String? phoneNo,
    bool? isPhoneVerified,
    String? country,
    String? countryCode,
    String? email,
    bool? isEmailVerified,
    int? filesIdAvatar,
    String? socialFacebookId,
    String? socialFacebookToken,
    String? socialLinkedInId,
    String? socialLinkedInToken,
    String? socialGmailId,
    String? socialAppleId,
    bool? isNotifications,
    bool? isFaceIdEnabled,
    String? avatarUrl,
    String? fullName,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    bool? pushNotifications,
    bool? emailNotifications,
    bool? smsNotifications,
    int? wonAuctionsId,
    String? wonUrlImageAuctions,
    DateTime? wonChangedOn,
    double? wonMemberBonus,
    int? wonItemsId,
    String? wonNameItems,
    String? wonUrlImageItems,
    String? wonShippingCompany,
    int? aucAuctionsId,
    String? aucUrlImage,
    double? aucMemberTotalAmount,
    double? aucMemberBidAmount,
    double? aucHighestAmountBid,
    DateTime? aucExpiresOn,
    double? aucMemberBonus,
    String? otpForgotPassword,
    bool? isBlocked,
    int? auctionsWin,
    int? myPoints,
    int? totalAuctions,
    String? otp,
  }) {
    return MemberInfoEntity(
      id: id ?? this.id,
      isDeleted: isDeleted ?? this.isDeleted,
      changedOn: changedOn ?? this.changedOn,
      tokensIdChangedBy: tokensIdChangedBy ?? this.tokensIdChangedBy,
      tokensId: tokensId ?? this.tokensId,
      metasGuid: metasGuid ?? this.metasGuid,
      userName: userName ?? this.userName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNo: phoneNo ?? this.phoneNo,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      country: country ?? this.country,
      phoneCountryCode: phoneCountryCode ?? this.phoneCountryCode,
      email: email ?? this.email,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      filesIdAvatar: filesIdAvatar ?? this.filesIdAvatar,
      socialFacebookId: socialFacebookId ?? this.socialFacebookId,
      socialFacebookToken: socialFacebookToken ?? this.socialFacebookToken,
      socialLinkedInId: socialLinkedInId ?? this.socialLinkedInId,
      socialLinkedInToken: socialLinkedInToken ?? this.socialLinkedInToken,
      socialGmailId: socialGmailId ?? this.socialGmailId,
      socialAppleId: socialAppleId ?? this.socialAppleId,
      isNotifications: isNotifications ?? this.isNotifications,
      isFaceIdEnabled: isFaceIdEnabled ?? this.isFaceIdEnabled,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      fullName: fullName ?? this.fullName,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      pushNotifications: pushNotifications ?? this.pushNotifications,
      emailNotifications: emailNotifications ?? this.emailNotifications,
      smsNotifications: smsNotifications ?? this.smsNotifications,
      wonAuctionsId: wonAuctionsId ?? this.wonAuctionsId,
      wonUrlImageAuctions: wonUrlImageAuctions ?? this.wonUrlImageAuctions,
      wonChangedOn: wonChangedOn ?? this.wonChangedOn,
      wonMemberBonus: wonMemberBonus ?? this.wonMemberBonus,
      wonItemsId: wonItemsId ?? this.wonItemsId,
      wonNameItems: wonNameItems ?? this.wonNameItems,
      wonUrlImageItems: wonUrlImageItems ?? this.wonUrlImageItems,
      wonShippingCompany: wonShippingCompany ?? this.wonShippingCompany,
      aucAuctionsId: aucAuctionsId ?? this.aucAuctionsId,
      aucUrlImage: aucUrlImage ?? this.aucUrlImage,
      aucMemberTotalAmount: aucMemberTotalAmount ?? this.aucMemberTotalAmount,
      aucMemberBidAmount: aucMemberBidAmount ?? this.aucMemberBidAmount,
      aucHighestAmountBid: aucHighestAmountBid ?? this.aucHighestAmountBid,
      aucExpiresOn: aucExpiresOn ?? this.aucExpiresOn,
      aucMemberBonus: aucMemberBonus ?? this.aucMemberBonus,
      otpForgotPassword: otpForgotPassword ?? this.otpForgotPassword,
      isBlocked: isBlocked ?? this.isBlocked,
      auctionsWin: auctionsWin ?? this.auctionsWin,
      myPoints: myPoints ?? this.myPoints,
      totalAuctions: totalAuctions ?? this.totalAuctions,
      otp: otp ?? this.otp,
    );
  }

  @override
  List<Object?> get props => [
        id,
        isDeleted,
        changedOn,
        tokensIdChangedBy,
        tokensId,
        metasGuid,
        userName,
        firstName,
        lastName,
        phoneNo,
        isPhoneVerified,
        country,
        phoneCountryCode,
        email,
        isEmailVerified,
        filesIdAvatar,
        socialFacebookId,
        socialFacebookToken,
        socialLinkedInId,
        socialLinkedInToken,
        socialGmailId,
        socialAppleId,
        isNotifications,
        isFaceIdEnabled,
        avatarUrl,
        fullName,
        address,
        city,
        state,
        zipCode,
        pushNotifications,
        emailNotifications,
        smsNotifications,
        wonAuctionsId,
        wonUrlImageAuctions,
        wonChangedOn,
        wonMemberBonus,
        wonItemsId,
        wonNameItems,
        wonUrlImageItems,
        wonShippingCompany,
        aucAuctionsId,
        aucUrlImage,
        aucMemberTotalAmount,
        aucMemberBidAmount,
        aucHighestAmountBid,
        aucExpiresOn,
        aucMemberBonus,
        otpForgotPassword,
        isBlocked,
        auctionsWin,
        myPoints,
        totalAuctions,
        otp,
      ];
}
