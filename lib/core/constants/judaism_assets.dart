/// Centralized asset management for Judaism-related images
/// This file contains all image paths from the assets/judaism directory
///
/// Usage Examples:
/// ```dart
/// // Main branding assets
/// Image.asset(JudaismAssets.branding.logo)
/// Image.asset(JudaismAssets.branding.splashBackground)
///
/// // Volume controls
/// Image.asset(JudaismAssets.volume.volumeUp)
/// Image.asset(JudaismAssets.volume.volumeOff)
///
/// // Vector graphics
/// Image.asset(JudaismAssets.vectors.vector1)
/// Image.asset(JudaismAssets.vectors.vector2)
///
/// // UI components
/// Image.asset(JudaismAssets.ui.settings)
/// Image.asset(JudaismAssets.ui.notifications)
/// Image.asset(JudaismAssets.ui.home1)
///
/// // Groups and layouts
/// Image.asset(JudaismAssets.groups.group1)
/// Image.asset(JudaismAssets.groups.group18)
///
/// // Format shapes
/// Image.asset(JudaismAssets.formats.formatShapes1)
/// ```
///
/// Benefits:
/// - Easy to change asset paths globally
/// - No hardcoded asset paths throughout the codebase
/// - Better organization and maintainability
/// - Type-safe asset references
class JudaismAssets {
  const JudaismAssets();

  /// Base asset directory for judaism assets
  static const String _judaismPath = 'assets/judaism';

  /// Main branding assets (logo and splash background)
  static final BrandingAssets branding = BrandingAssets._();

  /// Volume control assets
  static final VolumeAssets volume = VolumeAssets._();

  /// Vector graphics assets
  static final VectorAssets vectors = VectorAssets._();

  /// UI component assets
  static final UIAssets ui = UIAssets._();

  /// Group and layout assets
  static final GroupAssets groups = GroupAssets._();

  /// Format and shape assets
  static final FormatAssets formats = FormatAssets._();
}

/// Volume control related assets
class VolumeAssets {
  const VolumeAssets._();

  // Volume up icons
  String get volumeUp =>
      '${JudaismAssets._judaismPath}/volume_up_fill0_wght400_grad0_opsz48.png';
  String get volumeUp1 =>
      '${JudaismAssets._judaismPath}/volume_up_fill0_wght400_grad0_opsz48_1.png';
  String get volumeUp2 =>
      '${JudaismAssets._judaismPath}/volume_up_fill0_wght400_grad0_opsz48_2.png';
  String get volumeUp3 =>
      '${JudaismAssets._judaismPath}/volume_up_fill0_wght400_grad0_opsz48_3.png';
  String get volumeUp4 =>
      '${JudaismAssets._judaismPath}/volume_up_fill0_wght400_grad0_opsz48_4.png';
  String get volumeUp5 =>
      '${JudaismAssets._judaismPath}/volume_up_fill0_wght400_grad0_opsz48_5.png';

  // Volume off icons
  String get volumeOff =>
      '${JudaismAssets._judaismPath}/volume_off_fill0_wght400_grad0_opsz48.png';
  String get volumeOff1 =>
      '${JudaismAssets._judaismPath}/volume_off_fill0_wght400_grad0_opsz48_1.png';
  String get volumeOff2 =>
      '${JudaismAssets._judaismPath}/volume_off_fill0_wght400_grad0_opsz48_2.png';
  String get volumeOff3 =>
      '${JudaismAssets._judaismPath}/volume_off_fill0_wght400_grad0_opsz48_3.png';
  String get volumeOff4 =>
      '${JudaismAssets._judaismPath}/volume_off_fill0_wght400_grad0_opsz48_4.png';
  String get volumeOff5 =>
      '${JudaismAssets._judaismPath}/volume_off_fill0_wght400_grad0_opsz48_5.png';
}

/// Vector graphics assets
class VectorAssets {
  const VectorAssets._();

  String get vector => '${JudaismAssets._judaismPath}/vector.png';
  String get vector1 => '${JudaismAssets._judaismPath}/vector_1.png';
  String get vector2 => '${JudaismAssets._judaismPath}/vector_2.png';
  String get vector3 => '${JudaismAssets._judaismPath}/vector_3.png';
  String get vector4 => '${JudaismAssets._judaismPath}/vector_4.png';
  String get vector5 => '${JudaismAssets._judaismPath}/vector_5.png';
  String get vector6 => '${JudaismAssets._judaismPath}/vector_6.png';
  String get vector7 => '${JudaismAssets._judaismPath}/vector_7.png';
  String get vector8 => '${JudaismAssets._judaismPath}/vector_8.png';
  String get vector9 => '${JudaismAssets._judaismPath}/vector_9.png';
}

/// UI component assets
class UIAssets {
  const UIAssets._();

  // Settings and configuration
  String get settings => '${JudaismAssets._judaismPath}/settings.png';
  String get notifications => '${JudaismAssets._judaismPath}/notifications.png';
  String get notificationsV1 =>
      '${JudaismAssets._judaismPath}/notifications_v1.png';
  String get notificationsV2 =>
      '${JudaismAssets._judaismPath}/notifications_v2.png';
  String get iconEmail => '${JudaismAssets._judaismPath}/icon_email.png';
  String get home1 => '${JudaismAssets._judaismPath}/home_1.png';
  String get frame => '${JudaismAssets._judaismPath}/frame.png';
  String get rectangle312 => '${JudaismAssets._judaismPath}/rectangle_312.png';
  String get ellipse1 => '${JudaismAssets._judaismPath}/ellipse_1.png';
  String get sponsoredImage =>
      '${JudaismAssets._judaismPath}/sponsored_image.png';
} //assets/judaism/ellipse_1.png

/// Group and layout assets
class GroupAssets {
  const GroupAssets._();

  String get group => '${JudaismAssets._judaismPath}/group.png';
  String get group1 => '${JudaismAssets._judaismPath}/group_1.png';
  String get group18 => '${JudaismAssets._judaismPath}/group_18.png';
  String get group2265 => '${JudaismAssets._judaismPath}/group_2265.png';
  String get group2267 => '${JudaismAssets._judaismPath}/group_2267.png';
  String get group2293 => '${JudaismAssets._judaismPath}/group_2293.png';
}

/// Main branding assets (logo and splash background)
class BrandingAssets {
  const BrandingAssets._();

  /// Main app logo - "The What & Why of Judaism"
  String get logo => '${JudaismAssets._judaismPath}/logo.png';

  /// Splash screen background - spiritual book with emanating light
  String get splashBackground => '${JudaismAssets._judaismPath}/splash_bg.png';

  /// Splash screen vector background
  String get splashScreenVector =>
      '${JudaismAssets._judaismPath}/splashscreen_vector.png';

  /// Login header waves (primary/secondary)
  /// If the files 'login_top_wave_primary.png' and 'login_top_wave_secondary.png'
  /// are not present in assets, callers should use an errorBuilder fallback.
  String get loginTopWavePrimary =>
      '${JudaismAssets._judaismPath}/login_top_wave_primary.png';
  String get loginTopWaveSecondary =>
      '${JudaismAssets._judaismPath}/login_top_wave_secondary.png';

  /// Combined single wave image for the login header
  String get loginTopWave => '${JudaismAssets._judaismPath}/login_top_wave.png';
}

/// Format and shape assets
class FormatAssets {
  const FormatAssets._();

  String get formatShapes1 =>
      '${JudaismAssets._judaismPath}/format_shapes_fill1_wght400_grad0_opsz48_(1)_1.png';
  String get formatShapes11 =>
      '${JudaismAssets._judaismPath}/format_shapes_fill1_wght400_grad0_opsz48_(1)_1_1.png';
  String get formatShapes12 =>
      '${JudaismAssets._judaismPath}/format_shapes_fill1_wght400_grad0_opsz48_(1)_1_2.png';
}
