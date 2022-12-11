part of 'switch_theme_cubit.dart';

@immutable
abstract class SwitchThemeState {}

class SwitchThemeInitial extends SwitchThemeState {}

class ThemeState extends SwitchThemeState {
  final Brightness brightness;

  ThemeState(this.brightness);
}
