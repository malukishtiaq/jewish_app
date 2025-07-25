import 'package:jewish_app/core/ui/components/components.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
