import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/export_files.dart';
import '../../../../../core/constants/enums/verification_type.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../../domain/entity/member_info_entity.dart';
import '../../../domain/entity/send_otp_entity.dart';
import '../../state_m/account/account_cubit.dart';
import '../../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
import '../../../../../core/ui/error_ui/error_viewer/snack_bar/errv_snack_bar_options.dart';
import '../../../../../core/ui/widgets/base/base_loader.dart';
import '../../../../../core/ui/widgets/base/base_messages.dart';
import 'login_screen_content.dart';

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
          listener: (context, state) {
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
                    // Nav.off(
                    //   AppMainScreen.routeName,
                    //   arguments: AppMainScreenParam(
                    //     accountEntity: accountEntity,
                    //   ),
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
          },
          builder: (context, state) {
            return state.mapOrNull(
                  accountLoading: (_) {
                    return const BaseLoader(
                      isLoading: true,
                      child: LoginScreenContent(),
                    );
                  },
                  loginSuccess: (_) => const LoginScreenContent(),
                  socialMediaSuccess: (_) => const LoginScreenContent(),
                ) ??
                const LoginScreenContent();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
