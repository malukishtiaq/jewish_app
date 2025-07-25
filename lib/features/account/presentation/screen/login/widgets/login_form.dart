import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/core/common/utils/validation_functions.dart';
import 'package:jewish_app/features/account/presentation/state_m/account/account_cubit.dart';
import 'package:jewish_app/export_files.dart';
import 'package:jewish_app/core/ui/widgets/custom_text_form_field.dart';
import 'package:jewish_app/features/account/data/request/param/login_param.dart';

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
          AppSpaces.lg,
          _buildLoginButton(context, cubit),
          AppSpaces.xl,
          _buildSignInWithText(context),
          AppSpaces.lg,
          _buildSignUpSection(context),
        ],
      ),
    );
  }

  Widget _buildEmailInput(BuildContext context, AccountCubit cubit) {
    return SizedBox(
      height: AppSpacing.inputHeight,
      child: CustomTextFormField(
        controller: cubit.usernameController,
        hintText: "lbl_username_email".tr,
        textInputType: TextInputType.emailAddress,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
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
            return "err_msg_please_enter_valid_email".tr;
          }
          return null;
        },
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, AccountCubit cubit) {
    return SizedBox(
      height: AppSpacing.buttonHeight,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          cubit.login(LoginParam(email: cubit.usernameController.text));
        },
        style: CustomButtonStyles.fillPurple,
        child: AppBody.large("lbl_login".tr, color: Colors.white),
      ),
    );
  }

  Widget _buildSignInWithText(BuildContext context) {
    return AppBody.medium(
      "msg_sign_in_with_account".tr,
      color: context.colorScheme.onSurface.withValues(alpha: 0.5),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSignUpSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBody.medium(
          "Don't Have an Account?",
          color: const Color(0xFF252525),
        ),
        AppSpaces.hSM,
        GestureDetector(
          onTap: () {
            // Navigate to sign up screen
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
