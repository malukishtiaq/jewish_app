import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/core/common/utils/validation_functions.dart';
import 'package:jewish_app/features/account/presentation/state_m/account/account_cubit.dart';
import 'package:jewish_app/export_files.dart';
import 'package:jewish_app/core/ui/widgets/custom_text_form_field.dart';
import 'package:jewish_app/features/account/presentation/screen/login/register_screen.dart';
import 'package:jewish_app/features/home/presentation/screen/home_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AccountCubit>();

    return Container(
      constraints: const BoxConstraints(minWidth: 343, maxWidth: 500),
      padding: AppSpacing.horizontalLG,
      child: Column(
        children: [
          _buildEmailInput(context, cubit),
          AppSpaces.md,
          _buildPasswordInput(context, cubit),
          AppSpaces.lg,
          _buildLoginButton(context, cubit),
          AppSpaces.md2,
          Text(
            'Forgot Password?',
            textAlign: TextAlign.center,
            style: CustomTextStyles.forgotPasswordLink(context),
          ),
          AppSpaces.sm,
          _buildSocialLoginSection(context),
          AppSpaces.sm,
          _buildSignUpSection(context),
          Center(
            child: CustomImageView(
              width: 238,
              height: 100,
              imagePath: JudaismAssets.ui.sponsoredImage,
              fit: BoxFit.contain,
            ),
          ),
          10.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Text(
              "The Alan and Mindy Peyser in honor of Paul Peyser - Pinchas ben David a'h",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF6C7C89),
                fontSize: 12,
                fontFamily: 'Inter',
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailInput(BuildContext context, AccountCubit cubit) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: 343,
        child: CustomTextFormField(
          controller: cubit.usernameController,
          hintText: 'email@gmail.com',
          textInputType: TextInputType.emailAddress,
          fieldLabel: 'Email',
          leadingIcon:
              Image.asset(JudaismAssets.ui.iconEmail, width: 16, height: 16),
          leadingIconPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          textStyle: context.textTheme.bodyMedium?.copyWith(
            fontFamily: 'Inter',
            fontSize: 14,
            color: const Color(0xFF252525),
          ),
          hintStyle: context.textTheme.bodyMedium?.copyWith(
            fontFamily: 'Inter',
            fontSize: 14,
            color: const Color(0x80252525),
          ),
          validator: (value) {
            if (value == null || (!isValidEmail(value, isRequired: true))) {
              return 'err_msg_please_enter_valid_email'.tr;
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildPasswordInput(BuildContext context, AccountCubit cubit) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: 343,
        child: CustomTextFormField(
          controller: cubit.passwordController,
          hintText: '******',
          obscureText: true,
          fieldLabel: 'Password',
          leadingIcon: const Icon(Icons.lock_outline,
              size: 18, color: Color(0xFF8A5694)),
          leadingIconPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          textStyle: context.textTheme.bodyMedium?.copyWith(
            fontFamily: 'Inter',
            fontSize: 14,
            color: const Color(0xFF252525),
          ),
          hintStyle: context.textTheme.bodyMedium?.copyWith(
            fontFamily: 'Inter',
            fontSize: 14,
            color: const Color(0x80252525),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'err_msg_please_enter_valid_password'.tr;
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, AccountCubit cubit) {
    return Container(
      width: 304,
      height: 44,
      margin: AppSpacing.horizontalXL,
      decoration: ShapeDecoration(
        color: const Color(0xFF8A5694),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        shadows: const [
          BoxShadow(
            color: Color(0xFF74C6C4),
            blurRadius: 8,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          // For now, navigate to home to mimic success flow
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routeName,
            (route) => false,
          );
        },
        style: CustomButtonStyles.fillPurple,
        child: Text(
          'Sign In',
          textAlign: TextAlign.center,
          style: CustomTextStyles.buttonSignIn(context),
        ),
      ),
    );
  }

  // Removed unused sign-in text helper (integrated into social login section)

  Widget _buildSocialLoginSection(BuildContext context) {
    return Column(
      children: [
        AppDivider.standard(),
        AppSpaces.xs,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                // TODO: Implement Facebook login
              },
              icon:
                  const Icon(Icons.facebook_rounded, color: Color(0xFF1877F2)),
              iconSize: 40,
            ),
            AppSpaces.sm,
            IconButton(
              onPressed: () {
                // TODO: Implement Google login
              },
              icon: const Icon(Icons.mail, color: Color(0xFFDB4437)),
              iconSize: 40,
            ),
          ],
        ),
        AppSpaces.xs,
        AppDivider.standard(),
      ],
    );
  }

  Widget _buildSignUpSection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBody.medium(
          "Don't Have an Account?",
          color: const Color(0xFF252525),
        ),
        AppSpaces.hSM,
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RegisterScreen.routeName);
          },
          child: AppBody.large(
            'Sign Up',
            color: const Color(0xFFEC164F),
          ),
        ),
      ],
    );
  }
}
