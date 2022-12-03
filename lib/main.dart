import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pract4/cubit/click_cubit.dart';
import 'package:pract4/cubit/switch_theme_cubit.dart';
import 'package:pract4/cubit/log_update_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => ClickCubit()),
        BlocProvider(create: (BuildContext context) => SwitchThemeCubit()),
        BlocProvider(create: (BuildContext context) => LogUpdateCubit())
      ],
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
            theme: ThemeData(brightness: Brightness.light),
            debugShowCheckedModeBanner: false,
            home: MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
    // return MaterialApp(
    //     theme: ThemeData.light(),
    //     darkTheme: ThemeData.dark(),
    //     home: BlocProvider(
    //       create: (context) => ClickCubit(),
    //       child: MyHomePage(),
    //     ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static String counter = "0";
  static List<Widget> logs = [Text("none")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<ClickCubit, ClickState>(
              builder: (context, state) {
                if (state is ClickError) {
                  return Text(
                    counter = state.message,
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                if (state is Click) {
                  return Text(
                    counter = state.count.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                return Text(
                  "0",
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  child: const Text('-'),
                  onPressed: (() {
                    Brightness brightness = Theme.of(context).brightness;
                    context.read<ClickCubit>().onClick(brightness, "-");
                    context
                        .read<LogUpdateCubit>()
                        .onClick(logs, int.parse(counter), brightness);
                  })),
              ElevatedButton(
                  child: const Text('+'),
                  onPressed: (() {
                    Brightness brightness = Theme.of(context).brightness;
                    context.read<ClickCubit>().onClick(brightness, "+");
                    context
                        .read<LogUpdateCubit>()
                        .onClick(logs, int.parse(counter), brightness);
                  }))
            ]),
            BlocBuilder<LogUpdateCubit, LogUpdateState>(
              builder: (context, state) {
                if (state is Logs) {
                  return Expanded(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: state.logs,
                        )),
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context
            .read<SwitchThemeCubit>()
            .onClick(Theme.of(context).brightness),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
