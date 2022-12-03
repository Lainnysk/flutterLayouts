import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'switch_theme_state.dart';

class SwitchThemeCubit extends Cubit<SwitchThemeState> {
  SwitchThemeCubit() : super(SwitchThemeInitial());

    void onClick(Brightness brightness) {
    if(brightness == Brightness.dark) {
      emit(ThemeState(Brightness.light));
      return;
    }
    emit(ThemeState(Brightness.dark));
  }
}
