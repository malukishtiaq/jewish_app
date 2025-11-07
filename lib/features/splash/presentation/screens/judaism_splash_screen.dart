import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/core/constants/judaism_assets.dart';
import 'package:jewish_app/export_files.dart';
import 'package:jewish_app/features/account/presentation/screen/login/login_screen.dart';
import 'package:jewish_app/core/common/local_storage.dart';
import 'package:jewish_app/features/home/presentation/screen/main_navigation_screen.dart';

class JudaismSplashScreen extends StatefulWidget {
  const JudaismSplashScreen({super.key});

  @override
  State<JudaismSplashScreen> createState() => _JudaismSplashScreenState();
}

class _JudaismSplashScreenState extends State<JudaismSplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    // Wait for the splash animation (2 seconds)
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Check if user is already logged in
    final skipLogin = LocalStorage.skipLogin;
    final hasMemberId = LocalStorage.hasMemberID;

    if (skipLogin && hasMemberId) {
      // User is already logged in, go to home
      Navigator.of(context).pushReplacementNamed(
        MainNavigationScreen.routeName,
      );
    } else {
      // User needs to login
      Nav.off(
        LoginScreen.routeName,
        arguments: const LoginScreenParam(from: LoginFrom.mainScreen),
        context: context,
      );
    }
  }

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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0x00d9d9d9),
              Color(0xff6c7c89),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context, Size screenSize) {
    return Positioned.fill(
      child: SafeArea(
        child: Padding(
          padding: AppSpacing.horizontalLG,
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.06),

              // Logo at top
              Image.asset(
                JudaismAssets.branding.logo,
                width: screenSize.width * 0.7,
                fit: BoxFit.contain,
              ),

              const Spacer(),

              // Extra spacing at bottom for sponsor section
              SizedBox(height: screenSize.height * 0.32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSponsorSection(BuildContext context, Size screenSize) {
    return Positioned(
      bottom: screenSize.height * 0.04,
      left: 0,
      right: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Subtitle and Title above the orange badge
          Text(
            "Uncovering the Wisdom in",
            style: TextStyle(
              fontSize: screenSize.width * 0.04,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontFamily: 'Inter',
              letterSpacing: 0.3,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: screenSize.height * 0.008),

          Text(
            "Jewish Tradition",
            style: TextStyle(
              fontSize: screenSize.width * 0.08,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontFamily: 'Inter',
              letterSpacing: 0.5,
              height: 1.1,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: screenSize.height * 0.025),

          // "This App is sponsored by" section
          Stack(
            alignment: Alignment.center,
            children: [
              // Orange background image
              Image.asset(
                JudaismAssets.branding.splashScreenVector,
                width: screenSize.width * 0.58,
                fit: BoxFit.contain,
              ),

              // White text content
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "This App is",
                      style: TextStyle(
                        fontSize: screenSize.width * 0.042,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'Inter',
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "sponsored by",
                      style: TextStyle(
                        fontSize: screenSize.width * 0.042,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'Inter',
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: screenSize.height * 0.016),

          // Dedication Text (below the orange badge)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Text(
              "The Alan and Mindy Peyser in honor of Paul Peyser - Pinchas ben David a'h",
              style: TextStyle(
                fontSize: screenSize.width * 0.028,
                fontWeight: FontWeight.w400,
                color: Colors.white.withValues(alpha: 0.95),
                fontFamily: 'Inter',
                height: 1.35,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: screenSize.height * 0.02),

          // Animated Loading Dots
          Container(
            height: 20,
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: const _LoadingDots(),
          ),

          SizedBox(height: screenSize.height * 0.01),
        ],
      ),
    );
  }
}

// Animated Loading Dots Widget
class _LoadingDots extends StatefulWidget {
  const _LoadingDots();

  @override
  State<_LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<_LoadingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(3, (index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final delay = index * 0.3;
              final value = (_controller.value - delay).clamp(0.0, 1.0);
              final opacity = (Curves.easeInOut.transform(value) * 2 - 1).abs();

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Color.lerp(
                      const Color(0xFFF2A41E).withValues(alpha: 0.4),
                      const Color(0xFFF2A41E),
                      opacity,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFF2A41E)
                            .withValues(alpha: 0.2 + opacity * 0.5),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
