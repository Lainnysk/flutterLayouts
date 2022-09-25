import 'package:flutter/material.dart';
import 'package:flutter_application_2/medinow.dart';
import 'package:flutter_application_2/deepRelax.dart';
import 'package:flutter_application_2/meditate.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen(),
      //home: deepRelax(),
      //home: meditate(),
    );
  }
}