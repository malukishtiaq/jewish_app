import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../di/service_locator.dart';
import '../../features/account/presentation/state_m/account/account_cubit.dart';
import '../localization/localization_provider.dart';
import '../providers/session_data.dart';

/// Centralizing all app providers in one class to be easy to adjust and read
class ApplicationProvider {
  static final ApplicationProvider _instance = ApplicationProvider._init();

  factory ApplicationProvider() => _instance;

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];

  List<SingleChildWidget> dependItems = [
    /// Change notifier provider

    ChangeNotifierProvider.value(value: getIt<SessionData>()),
  ];

  List<SingleChildWidget> uiChangesItems = [];

  void dispose(BuildContext context) {
    debugPrint("Disposed app providers");
    Provider.of<LocalizationProvider>(context, listen: false).dispose();
    getIt<SessionData>().dispose();
    BlocProvider.of<AccountCubit>(context, listen: false).close();
  }
}
