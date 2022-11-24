import 'package:flutter/material.dart';
import 'package:pr2/core/db/data_base_helper.dart';
import 'package:pr2/Screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    DataBaseHelper dataBaseHelper = DataBaseHelper.instance;
    dataBaseHelper.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen(),
    );
  }
}
