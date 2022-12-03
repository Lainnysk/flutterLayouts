import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:meta/meta.dart';

part 'click_state.dart';

class ClickCubit extends Cubit<ClickState> {
  ClickCubit() : super(ClickInitial());

  int count = 0;
  int raiseNum = 0;

  void onClick(Brightness brightness, String op) {
    if (brightness == Brightness.dark)
      raiseNum = 2;
    else
      raiseNum = 1;

    if (op == "+")
      count += raiseNum;
    else
      count -= raiseNum;

    emit(Click(count));
  }
}
