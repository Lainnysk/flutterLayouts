part of 'log_update_cubit.dart';

@immutable
abstract class LogUpdateState {}

class LogUpdateInitial extends LogUpdateState {}

class Logs extends LogUpdateState {
  
  final List<Widget> logs;

  Logs(this.logs);
}