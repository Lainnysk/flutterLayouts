import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pract5/Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cubit/switch_theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

Brightness brightness = Brightness.light;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SwitchThemeCubit(),
        child: BlocBuilder<SwitchThemeCubit, SwitchThemeState>(
            builder: (context, state) {
          if (state is ThemeState) {
            return MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(brightness: state.brightness),
                debugShowCheckedModeBanner: false,
                home: MyHomePage(title: 'Flutter Demo Home Page'));
          }
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(brightness: brightness),
            debugShowCheckedModeBanner: false,
            home: MyHomePage(title: 'Flutter Demo Home Page'),
          );
        }));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> inputKey = GlobalKey();
  TextEditingController inputController = TextEditingController();
  SharedPreferences? sharedPreferences;

  Future<void> initShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    initShared().then((value) {
      sharedPreferences!.clear();
      setState(() {
        if (sharedPreferences!.getString("text") != null) {
          if (sharedPreferences!.getBool("darkTheme") != null &&
              sharedPreferences!.getBool("darkTheme") as bool) {
            brightness = Brightness.dark;
          }
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen(
                        text: sharedPreferences!.getString("text"),
                        brightness: brightness,
                      )));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: inputKey,
              child: TextFormField(
                controller: inputController,
                textAlign: TextAlign.center,
                validator: ((value) {
                  if (value == null || value.trim() == "") return "Enter text";
                }),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Text",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (inputKey.currentState!.validate()) {
                  sharedPreferences!.setString("text", inputController.text);
                  sharedPreferences!.setBool("darkTheme", Theme.of(context).brightness == Brightness.dark ? true : false);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen(
                        text: inputController.text,
                        brightness: Theme.of(context).brightness,
                      ),
                    ),
                  );
                }
              },
              child: const Text("Go"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<SwitchThemeCubit>()
              .onClick(Theme.of(context).brightness);
          // if (Theme.of(context).brightness == Brightness.dark)
          //   sharedPreferences!.setBool("darkTheme", true);
          // else
          //   sharedPreferences!.setBool("darkTheme", false);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
