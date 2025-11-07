import 'package:jewish_app/core/ui/components/components.dart';
// import 'package:jewish_app/core/constants/app_assets.dart';
import 'package:jewish_app/export_files.dart';
import 'login_form.dart';
import 'login_header.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.onPrimary,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              const LoginHeader(),
              Text(
                'Welcome Back!',
                style: CustomTextStyles.welcomeBackTaz(context),
                textAlign: TextAlign.center,
              ),
              AppSpaces.md2,
              const LoginForm(),
              AppSpaces.md2,
              _SponsorSection(),
              SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}

class _SponsorSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 138,
      height: 5,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
