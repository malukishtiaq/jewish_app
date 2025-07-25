import 'package:jewish_app/features/account/presentation/state_m/account/account_cubit.dart';

abstract class SocialActionBase {
  String get icon;
  String get name;
  Future<void> socialAction(AccountCubit accountCubit);
}
