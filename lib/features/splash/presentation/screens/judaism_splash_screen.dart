/// Judaism Splash Screen
///
/// A beautiful splash screen for the Jewish app featuring:
/// - Background image with gradient overlay
/// - "Jewish Tradition" title and subtitle
/// - Dedication text
/// - Sponsor information with logo
/// - Decorative pattern elements
///
/// Usage:
/// ```dart
/// Navigator.push(
///   context,
///   MaterialPageRoute(
///     builder: (context) => const JudaismSplashScreen(),
///   ),
/// );
/// ```
///
/// Features:
/// - Fully responsive design
/// - Clean, organized code structure
/// - Proper asset management
/// - Accessibility considerations
import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/core/constants/judaism_assets.dart';
import 'package:jewish_app/export_files.dart';
import 'package:jewish_app/features/account/presentation/screen/login/login_screen.dart';
import '../widgets/decorative_pattern.dart';

class JudaismSplashScreen extends StatelessWidget {
  const JudaismSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background Image
          _buildBackgroundImage(screenSize),

          // Gradient Overlay
          _buildGradientOverlay(screenSize),

          // Main Content
          _buildMainContent(context, screenSize),

          // Login Button
          _buildLoginButton(context, screenSize),

          // Sponsor Section
          _buildSponsorSection(context, screenSize),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage(Size screenSize) {
    return Positioned.fill(
      child: Image.asset(
        JudaismAssets.branding.splashBackground,
        width: screenSize.width,
        height: screenSize.height,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildGradientOverlay(Size screenSize) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: screenSize.width,
        height: screenSize.height * 0.6,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0x00d9d9d9),
              const Color(0xff6c7c89),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context, Size screenSize) {
    return Positioned(
      bottom: screenSize.height * 0.25,
      left: 0,
      right: 0,
      child: Padding(
        padding: AppSpacing.horizontalLG,
        child: Column(
          children: [
            // Decorative Pattern
            _buildDecorativePattern(),

            SizedBox(height: screenSize.height * 0.03),

            // Main Title
            Text(
              "Jewish Tradition",
              style: TextStyle(
                fontSize: screenSize.width * 0.07, // Responsive font size
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: screenSize.height * 0.01),

            // Subtitle
            Text(
              "Uncovering the Wisdom in",
              style: TextStyle(
                fontSize: screenSize.width * 0.035,
                fontWeight: FontWeight.w600,
                color: Colors.white.withValues(alpha: 0.9),
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: screenSize.height * 0.02),

            // Dedication Text
            Text(
              "The Alan and Mindy Peyser in honor of Paul Peyser - Pinchas ben David a'h",
              style: TextStyle(
                fontSize: screenSize.width * 0.03,
                fontWeight: FontWeight.w500,
                color: Colors.white.withValues(alpha: 0.8),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDecorativePattern() {
    return const DecorativePattern();
  }

  Widget _buildSponsorSection(BuildContext context, Size screenSize) {
    return Positioned(
      bottom: screenSize.height * 0.07,
      left: 98,
      right: 98,
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              JudaismAssets.branding.splashScreenVector,
              width: screenSize.width,
              height: screenSize.height * 0.25,
              fit: BoxFit.contain,
            ),
          ),

          // Content
          Padding(
            padding: AppSpacing.horizontalLG,
            child: Column(
              children: [
                // Sponsor Text
                Text(
                  "This App is\nsponsored by",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.035,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: screenSize.height * 0.01),

                // Sponsor Logo
                Image.asset(
                  JudaismAssets.branding.logo,
                  width: screenSize.width * 0.45, // Responsive width
                  height: screenSize.width * 0.12,
                ),

                SizedBox(height: screenSize.height * 0.02),

                // Progress Bar
                Container(
                  width: screenSize.width * 0.6,
                  height: screenSize.height * 0.012,
                  decoration: BoxDecoration(
                    color: const Color(0xffd9d9d9),
                    borderRadius:
                        BorderRadius.circular(screenSize.height * 0.006),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.97,
                    child: Container(
                      height: screenSize.height * 0.004,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(screenSize.height * 0.002),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, Size screenSize) {
    return Positioned(
      bottom: screenSize.height * 0.18,
      left: 24,
      right: 24,
      child: SizedBox(
        height: 44,
        child: ElevatedButton(
          style: CustomButtonStyles.fillPurple,
          onPressed: () {
            Nav.off(
              LoginScreen.routeName,
              arguments: const LoginScreenParam(from: LoginFrom.mainScreen),
              context: context,
            );
          },
          child: const AppBody.large(
            'Sign In',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
