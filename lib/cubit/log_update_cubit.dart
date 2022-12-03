import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'log_update_state.dart';

class LogUpdateCubit extends Cubit<LogUpdateState> {
  LogUpdateCubit() : super(LogUpdateInitial());

   void onClick(List<Widget> logs, int counter, Brightness brightness) {
    
    String theme = brightness == Brightness.dark ? "Dark theme" : "Light theme";
    String text = DateTime.now().toString() + " " + counter.toString() + " " + theme; 
    logs.insert(0, Text(text));

    emit(Logs(logs));
  }
}
