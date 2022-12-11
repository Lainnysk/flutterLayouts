import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cubit/switch_theme_cubit.dart';
import 'main.dart';

SharedPreferences? sharedPreferences;

class Screen extends StatefulWidget {
  Screen({super.key, required this.text, required this.brightness});

  final String? text;
  final Brightness brightness;

  @override
  State<Screen> createState() {
    return ScreenHomePageState();
  }
}

class ScreenHomePageState extends State<Screen> {
  Future<void> initShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    Brightness curBr = widget.brightness;
    return BlocProvider(
        create: (BuildContext context) => SwitchThemeCubit(),
        child: BlocBuilder<SwitchThemeCubit, SwitchThemeState>(
            builder: (context, state) {
          if (state is ThemeState) {
            Brightness curBr = state.brightness;
          }
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: curBr,
              ),
              home: Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.text!),
                      ],
                    ),
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    bool darkTheme = false;
                    if (Theme.of(context).brightness == Brightness.dark)
                      darkTheme = true;
                    SharedPreferences.getInstance().then((value) {
                      value.setBool("darkTheme", darkTheme);
                    });
                    context
                        .read<SwitchThemeCubit>()
                        .onClick(Theme.of(context).brightness);
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ));
        }));
  }
}
