import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/core/constants/app_assets.dart';
import 'package:jewish_app/export_files.dart';
import 'package:jewish_app/features/account/presentation/state_m/account/account_cubit.dart';
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
              children: [
                const Spacer(flex: 2),
                const LoginHeader(),
                AppSpaces.xl,
                const LoginForm(),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
