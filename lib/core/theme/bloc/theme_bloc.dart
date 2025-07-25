import 'package:equatable/equatable.dart';
import 'package:jewish_app/core/common/app_config.dart';

import '../../../export_files.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(ThemeState initialState) : super(initialState) {
    on<ThemeChangeEvent>(_changeTheme);
  }

  _changeTheme(ThemeChangeEvent event, Emitter<ThemeState> emit) async {
    emit(state.copyWith(themeType: event.themeType));
  }
}
