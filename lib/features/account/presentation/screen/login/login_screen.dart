import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/core/ui/screens/base_screen.dart';
import 'package:jewish_app/core/ui/error_ui/error_viewer/error_viewer.dart';
import 'package:jewish_app/core/ui/error_ui/error_viewer/snack_bar/errv_snack_bar_options.dart';
import 'package:jewish_app/core/ui/widgets/base/base_loader.dart';
import 'package:jewish_app/core/ui/widgets/base/base_messages.dart';
import 'package:jewish_app/export_files.dart';
import 'package:jewish_app/features/account/domain/entity/member_info_entity.dart';
import 'package:jewish_app/features/account/presentation/state_m/account/account_cubit.dart';
import 'widgets/login_content.dart';

enum LoginFrom { onBoarding, mainScreen }

class LoginScreenParam {
  final LoginFrom from;
  const LoginScreenParam({this.from = LoginFrom.mainScreen});
}

class LoginScreen extends BaseScreen<LoginScreenParam> {
  static const routeName = "/LoginScreen";
  const LoginScreen({required super.param, super.key});

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.onPrimary,
      body: BlocProvider<AccountCubit>(
        create: (context) => AccountCubit(),
        child: BlocConsumer<AccountCubit, AccountState>(
          listener: _handleStateChanges,
          builder: (context, state) {
            return state.mapOrNull(
                  accountLoading: (_) => const BaseLoader(
                    isLoading: true,
                    child: LoginContent(),
                  ),
                  loginSuccess: (_) => const LoginContent(),
                  socialMediaSuccess: (_) => const LoginContent(),
                ) ??
                const LoginContent();
          },
        ),
      ),
    );
  }

  void _handleStateChanges(BuildContext context, AccountState state) {
    state.whenOrNull(
      accountError: (error, callback) async {
        ErrorViewer.showError(
          context: context,
          error: error,
          callback: callback,
          errorViewerOptions: const ErrVSnackBarOptions(),
        );
      },
      loginSuccess: (MemberInfoEntity accountEntity) {
        if (accountEntity.tokensId > 0) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Navigate to main screen
            // Nav.off(
            //   AppMainScreen.routeName,
            //   arguments: AppMainScreenParam(accountEntity: accountEntity),
            //   context: context,
            // );
          });
        } else {
          BaseMessages.show(
            context: context,
            message: "errorOccurred".tr,
            isError: true,
          );
        }
      },
      userLoginSuccess: (email) {
        // Navigate to validation screen
        // Nav.to(
        //   ValidationScreen.routeName,
        //   arguments: ValidationScreenParam(
        //     sendOtpEntity: SendOtpEntity(
        //       otp: "",
        //       id: 0,
        //       email: email,
        //       type: VerificationType.email,
        //     ),
        //   ),
        // );
      },
    );
  }
}
