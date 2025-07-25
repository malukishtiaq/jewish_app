part of 'theme_bloc.dart';

class ThemeEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ThemeChangeEvent extends ThemeEvent {
  ThemeChangeEvent({required this.themeType}) : super() {
    // AppConfig().setThemeData(themeType);
  }

  final String themeType;

  @override
  List<Object?> get props => [];
}
