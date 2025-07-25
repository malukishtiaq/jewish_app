import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/core/common/utils/validation_functions.dart';
import 'package:jewish_app/features/account/presentation/state_m/account/account_cubit.dart';
import '../../../../../../export_files.dart';
import 'package:jewish_app/core/ui/widgets/custom_text_form_field.dart';

import '../../../../data/request/param/login_param.dart';

class BuildLoginForm extends StatelessWidget {
  BuildLoginForm({super.key});
  AccountCubit? cubit;

  @override
  Widget build(BuildContext context) {
    cubit = context.read<AccountCubit>();
    return Container(
      constraints: const BoxConstraints(minWidth: 343, maxWidth: 500),
      padding: AppSpacing.horizontalLG,
      child: Column(
        children: [
          _buildUsernameInput(context),
          AppSpaces.sm,
          _buildLoginButton(context),
          AppSpaces.sm,
          SizedBox(height: AppSpacing.xxxl),
          AppBody.medium(
            "msg_sign_in_with_account".tr,
            color: context.colorScheme.onSurface.withOpacity(0.5),
            textAlign: TextAlign.center,
          ),
          AppSpaces.lg,
          _buildSignUpSection(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginButton(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          cubit?.login(LoginParam(email: cubit?.usernameController.text));
        },
        style: CustomButtonStyles.fillPurple,
        child: AppBody.large("lbl_login".tr, color: Colors.white),
      ),
    );
  }

  /// Section Widget
  Widget _buildUsernameInput(BuildContext context) {
    return SizedBox(
      height: 45,
      child: CustomTextFormField(
        controller: cubit?.usernameController,
        hintText: "lbl_username_email".tr,
        textInputType: TextInputType.emailAddress,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
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

  /// Section Widget
  Widget _buildSignUpSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AppBody.medium(
          "Don't Have an Account?",
          color: Color(0xFF252525),
        ),
        SizedBox(width: AppSpacing.sm),
        GestureDetector(
          onTap: () {},
          child: const AppBody.large('Sign Up', color: Color(0xFFEC164F)),
        ),
      ],
    );
  }
}
