import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/core/ui/widgets/custom_text_form_field.dart';
import 'package:jewish_app/core/ui/widgets/base/base_loader.dart';
import 'package:jewish_app/export_files.dart';
import 'package:jewish_app/features/account/presentation/state_m/account/account_cubit.dart';
import 'package:jewish_app/features/account/presentation/screen/login/login_screen.dart';
import 'package:jewish_app/features/account/data/request/param/resgister_param.dart';
import 'widgets/login_header.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.onPrimary,
      body: BlocProvider<AccountCubit>(
        create: (_) => AccountCubit(),
        child: BlocConsumer<AccountCubit, AccountState>(
          listener: (context, state) {
            state.maybeWhen(
              userRegisteredSuccess: (memberInfo) {
                // Show success message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Registration successful! Please login.'),
                    backgroundColor: Colors.green,
                  ),
                );
                // Navigate to login
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  LoginScreen.routeName,
                  (route) => false,
                  arguments: const LoginScreenParam(),
                );
              },
              registerError: (error, retry, param) {
                // Show error message with more details
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.message ??
                        'Registration failed. Please try again.'),
                    backgroundColor: Colors.red,
                    duration: const Duration(seconds: 5),
                  ),
                );
              },
              accountError: (error, retry) {
                // Show error message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.message ??
                        'Registration failed. Please try again.'),
                    backgroundColor: Colors.red,
                    duration: const Duration(seconds: 5),
                  ),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              accountLoading: () => true,
              orElse: () => false,
            );

            return BaseLoader(
              isLoading: isLoading,
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const LoginHeader(),
                      AppSpaces.lg,
                      Text(
                        'Create Account',
                        style: CustomTextStyles.welcomeBackTaz(context),
                        textAlign: TextAlign.center,
                      ),
                      AppSpaces.lg,
                      Padding(
                        padding: AppSpacing.horizontalLG,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomTextFormField(
                                fieldLabel: 'Name',
                                controller: _nameController,
                                hintText: 'John Paul Smith',
                                hintStyle: const TextStyle(
                                  color: Color(0xFF62606E),
                                  fontSize: 14,
                                  fontFamily: 'Futura Std',
                                  height: 1,
                                ),
                                leadingIcon:
                                    const Icon(Icons.person_outline, size: 17),
                                leadingIconPadding: const EdgeInsets.all(1.42),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                              ),
                              AppSpaces.md,
                              CustomTextFormField(
                                fieldLabel: 'Email',
                                controller: _emailController,
                                hintText: 'johnpaul@myemail.com',
                                hintStyle: const TextStyle(
                                  color: Color(0xFF62606E),
                                  fontSize: 14,
                                  fontFamily: 'Futura Std',
                                  height: 1,
                                ),
                                textInputType: TextInputType.emailAddress,
                                leadingIcon:
                                    const Icon(Icons.email_outlined, size: 17),
                                leadingIconPadding: const EdgeInsets.all(1.42),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!value.contains('@')) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              AppSpaces.md,
                              CustomTextFormField(
                                fieldLabel: 'Password',
                                controller: _passwordController,
                                hintText: '******',
                                hintStyle: const TextStyle(
                                  color: Color(0xFF62606E),
                                  fontSize: 14,
                                  fontFamily: 'Futura Std',
                                  height: 1,
                                ),
                                obscureText: true,
                                leadingIcon:
                                    const Icon(Icons.lock_outline, size: 17),
                                leadingIconPadding: const EdgeInsets.all(1.42),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              AppSpaces.xl,
                              SizedBox(
                                height: 44,
                                child: ElevatedButton(
                                  style: CustomButtonStyles.fillPurple,
                                  onPressed: isLoading
                                      ? null
                                      : () {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            final cubit =
                                                context.read<AccountCubit>();
                                            cubit.resgister(
                                              ResgisterParam(
                                                name:
                                                    _nameController.text.trim(),
                                                email: _emailController.text
                                                    .trim(),
                                                password:
                                                    _passwordController.text,
                                                phoneNo: '',
                                                phoneCountryCode: '',
                                                country: '',
                                                socialAppleId: '',
                                                socialFacebookId: '',
                                                socialFacebookToken: '',
                                                socialGmailId: '',
                                                socialLinkedInId: '',
                                                socialLinkedInToken: '',
                                              ),
                                            );
                                          }
                                        },
                                  child: Text('Register',
                                      style: CustomTextStyles.buttonSignIn(
                                          context)),
                                ),
                              ),
                              AppSpaces.sm,
                              AppDivider.standard(),
                              AppSpaces.sm,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // TODO: Implement Facebook registration
                                    },
                                    icon: const Icon(Icons.facebook_rounded,
                                        color: Color(0xFF1877F2)),
                                    iconSize: 40,
                                  ),
                                  AppSpaces.sm,
                                  IconButton(
                                    onPressed: () {
                                      // TODO: Implement Google registration
                                    },
                                    icon: const Icon(Icons.mail,
                                        color: Color(0xFFDB4437)),
                                    iconSize: 40,
                                  ),
                                ],
                              ),
                              AppSpaces.xs,
                              AppDivider.standard(),
                              AppSpaces.xs,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppBody.medium(
                                    'Already have an account?',
                                    color: const Color(0xFF252525),
                                  ),
                                  AppSpaces.hSM,
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        LoginScreen.routeName,
                                        arguments: const LoginScreenParam(),
                                      );
                                    },
                                    child: AppBody.large(
                                      'Login',
                                      color: const Color(0xFFEC164F),
                                    ),
                                  ),
                                ],
                              ),
                              AppSpaces.lg,
                              30.verticalSpace,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
