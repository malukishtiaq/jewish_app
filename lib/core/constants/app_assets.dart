/// Centralized asset management for the app
/// This file contains all image, icon, and asset paths used throughout the application
///
/// Usage:
/// - Images: AppAssets.images.logoWithBg
/// - Icons: AppAssets.icons.home
/// - Animations: AppAssets.animations.loading
///
/// Benefits:
/// - Easy to change asset paths globally
/// - No hardcoded asset paths throughout the codebase
/// - Better organization and maintainability
/// - Type-safe asset references
class AppAssets {
  AppAssets._();

  /// Base asset directories
  static const String _imagesPath = 'assets/images';
  static const String _iconsPath = 'assets/icons';
  static const String _gifsPath = 'assets/gif';
  static const String _camalotPath = 'assets/camalot';
  static const String _lottieAnimationsPath = 'assets/anim/lottie';

  /// Image assets
  static const AppImages images = AppImages._();

  /// Icon assets
  static const AppIcons icons = AppIcons._();

  /// Animation assets
  static const AppAnimations animations = AppAnimations._();

  /// Logo and branding assets
  static const AppLogos logos = AppLogos._();

  /// OTP and verification assets
  static const AppOTPAssets otp = AppOTPAssets._();
}

/// Image asset paths
class AppImages {
  const AppImages._();

  // Splash screen images
  String get splashBackground =>
      '${AppAssets._imagesPath}/splash_background.png';
  String get splashProgress => '${AppAssets._gifsPath}/splash_progress.gif';

  // Background images
  String get loginBackground => '${AppAssets._imagesPath}/login_background.png';
  String get registerBackground => 'assets/register_bg.png';
  String get landingPage => 'assets/landing_page.png';
  String get onboarding => 'assets/camalot/onboarding.png';

  // Profile and user images
  String get avatar => '${AppAssets._imagesPath}/img_ellipse_10.png';
  String get imageNotFound => '${AppAssets._imagesPath}/image_not_found.png';

  // Error state images
  String get error403 => '${AppAssets._imagesPath}/png/error/403.png';
  String get errorEmpty => '${AppAssets._imagesPath}/png/error/empty.png';
  String get errorServer =>
      '${AppAssets._imagesPath}/png/error/server_error.png';
  String get errorTimeout => '${AppAssets._imagesPath}/png/error/time_out.png';
  String get errorUnknown =>
      '${AppAssets._imagesPath}/png/error/unknowing_error.png';
}

/// Icon asset paths
class AppIcons {
  const AppIcons._();

  // Navigation icons
  String get home => '${AppAssets._imagesPath}/img_nav_home.svg';
  String get auctions => '${AppAssets._imagesPath}/img_nav_auctions.svg';
  String get notifications =>
      '${AppAssets._imagesPath}/img_nav_notifications.svg';
  String get settings => '${AppAssets._imagesPath}/img_group_6852.svg';

  // Common UI icons
  String get arrowLeft => '${AppAssets._imagesPath}/img_arrow_left.svg';
  String get arrowRight => '${AppAssets._imagesPath}/img_arrow_right.svg';
  String get arrowDown => '${AppAssets._imagesPath}/img_arrow_down.svg';
  String get eye => '${AppAssets._imagesPath}/img_eye.svg';
  String get close => '${AppAssets._imagesPath}/img_close.svg';
  String get search => '${AppAssets._imagesPath}/svg/mss/search.svg';
  String get filter => '${AppAssets._imagesPath}/filter_icon.svg';
  String get addCircle => '${AppAssets._imagesPath}/img_add_circle_fill.svg';
  String get trash => '${AppAssets._imagesPath}/trash.svg';
  String get logout =>
      '${AppAssets._imagesPath}/img_logoutfill0wght400grad0opsz48_1.svg';

  // Social media icons
  String get google => '${AppAssets._imagesPath}/img_google.svg';
  String get apple =>
      '${AppAssets._imagesPath}/img_2993701applebrandbrandsioslogoicon_1.svg';
  String get facebook =>
      '${AppAssets._imagesPath}/img_317746facebooksocial_mediasocialicon_1.svg';
  String get linkedin => '${AppAssets._imagesPath}/img_link.svg';

  // Status icons
  String get verified => '${AppAssets._imagesPath}/svg/mss/verified.svg';
  String get unverified => '${AppAssets._imagesPath}/svg/mss/unverified.svg';
  String get clock => '${AppAssets._imagesPath}/img_clock.svg';
  String get star => '${AppAssets._imagesPath}/star_icon.svg';

  // Gender icons
  String get male => '${AppAssets._imagesPath}/svg/mss/male_icon.svg';
  String get female => '${AppAssets._imagesPath}/svg/mss/female_icon.svg';

  // Flag icons
  String get flagAE => '${AppAssets._imagesPath}/svg/ae_flag.svg';
  String get flagGB => '${AppAssets._imagesPath}/svg/gb_flag.svg';
}

/// Animation asset paths
class AppAnimations {
  const AppAnimations._();

  // Lottie animations
  String get loading => '${AppAssets._lottieAnimationsPath}/loading.json';
  String get error =>
      '${AppAssets._lottieAnimationsPath}/error/general_error_placeholder.json';
  String get success => '${AppAssets._lottieAnimationsPath}/success.json';

  // GIF animations
  String get splashProgress => '${AppAssets._gifsPath}/splash_progress.gif';
}

/// Logo and branding asset paths
class AppLogos {
  const AppLogos._();

  // Main app logos
  String get camalotLogo => '${AppAssets._camalotPath}/logo.png';
  String get camalotLogoWithBg => '${AppAssets._camalotPath}/logo_with_bg.png';

  // Brand logos
  String get altaOneLogo => '${AppAssets._imagesPath}/img_group_6837.svg';

  // Navigation icons in camalot folder
  String get backIcon => '${AppAssets._camalotPath}/back_icon.png';
  String get deleteAccount => 'assets/camalot/delete_account.png';
}

/// OTP and verification related assets
class AppOTPAssets {
  const AppOTPAssets._();

  String get otpSentEmail =>
      '${AppAssets._imagesPath}/svg/mss/otp_sent_email.svg';
  String get otpSentPhone =>
      '${AppAssets._imagesPath}/svg/mss/otp_sent_phone.svg';
  String get otpVerifiedEmail =>
      '${AppAssets._imagesPath}/svg/mss/otp_verified_email.svg';
  String get otpVerifiedPhone =>
      '${AppAssets._imagesPath}/svg/mss/otp_verified_phone.svg';
  String get wrongOtpEmail =>
      '${AppAssets._imagesPath}/svg/mss/wrong_otp_email.svg';
  String get wrongOtpPhone =>
      '${AppAssets._imagesPath}/svg/mss/wrong_otp_phone.svg';
}
