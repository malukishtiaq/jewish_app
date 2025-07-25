import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/core/constants/app_assets.dart';
import '../../../../../export_files.dart';
import 'package:flutter/material.dart';

import '../../state_m/account/account_cubit.dart';
import 'widget/build_login_form.dart';

class LoginScreenContent extends StatelessWidget {
  const LoginScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.onPrimary,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: context.read<AccountCubit>().formKey,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.images.registerBackground),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: AppSpacing.xxxl * 2.5),
                // const LogoComponent(),
                AppSpaces.xl,
                AppHeadline.large(
                  'SIGN IN',
                  textAlign: TextAlign.center,
                  color: context.primaryColor,
                ),
                AppSpaces.md,
                Container(
                  width: 57,
                  height: 3,
                  decoration: BoxDecoration(
                    color: context.colorScheme.error,
                    borderRadius: BorderRadius.circular(AppSpacing.xs),
                  ),
                ),
                AppSpaces.lg,
                BuildLoginForm(),
                AppSpaces.lg,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
