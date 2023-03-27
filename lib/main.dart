import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cubits/current_user_info_cubit.dart';
import 'firebase_options.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "isip_n.a.kabanov@mpt.ru", password: "123!Qwe!");
  } on FirebaseAuthException catch (e) {
    print("Пользователь уже существует");
  }
  MyApp.emailLink = window.location.href;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  static String? emailLink;

  final GoRouter _router = GoRouter(
    initialLocation: '/main',
    debugLogDiagnostics: true,
    routerNeglect: true,
    routes: <GoRoute>[
      GoRoute(
        path: '/main',
        builder: (BuildContext context, GoRouterState state) {
          return MyHomePage(
              title: 'Work with firebase', link: MyApp.emailLink!);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentUserInfoCubit(),
      child: MaterialApp.router(
          title: "main",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routerConfig: _router),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.link});

  final String title;

  final String link;

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> authWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      showMessage("Успешная авторизация");
      setUserNameForCurrentUser();
    } on FirebaseAuthException catch (e) {
      showMessage(e.code.toString());
    }
  }

  void authAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      showMessage("Успешная анонимная авторизация");
      setUserNameForCurrentUser();
    } on FirebaseAuthException catch (e) {
      showMessage(e.code.toString());
    }
  }

  void authWihtEmailLink(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
    try {
      var acs = ActionCodeSettings(
          url: 'http://localhost:61139/#/main?email=$email',
          handleCodeInApp: true,
          androidInstallApp: true);
      await FirebaseAuth.instance
          .sendSignInLinkToEmail(email: email, actionCodeSettings: acs);
      showMessage("Ссылка отправлена");
      setUserNameForCurrentUser();
    } on FirebaseAuthException catch (e) {
      showMessage(e.code.toString());
    }
  }

  void setUserNameForCurrentUser() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      if (currentUser.isAnonymous) {
        this.currentUserName = "Анонимная авторизация";
      } else {
        this.currentUserName = currentUser.email!;
      }
    } else {
      this.currentUserName = "Вы не авторизированы";
    }
    pref!.setString("userName", currentUserName);
    this.context.read<CurrentUserInfoCubit>().onLoad(currentUserName);
  }

  void exitUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      showMessage("Вы успешно вышли");
      setUserNameForCurrentUser();
    } on FirebaseAuthException catch (e) {
      showMessage("Вы уже вышли или произошла ошибка");
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(this.context).showSnackBar(SnackBar(
        content: Text(
      message,
      textAlign: TextAlign.justify,
    )));
  }

  SharedPreferences? pref;

  void authWithEmailAndLink() async {
    try {
      String email = getEmailFromUri();
      await FirebaseAuth.instance
          .signInWithEmailLink(email: email, emailLink: widget.link);
      showMessage("Вы успешно авторизировались через ссылку");
      setUserNameForCurrentUser();
    } on FirebaseAuthException catch (e) {
      showMessage("Произошла ошибка или истёк срок действия ссылки");
    }
  }

    String getEmailFromUri() {
    RegExp reg = RegExp(r"email=(.+)\.(ru|com)");
    Match? match = reg.firstMatch(widget.link);
    String email =
        (match != null ? match.group(0).toString().split("=")[1] : "");
    return email;
  }

  @override
  void initState() {
    initSharedPreferences();
    super.initState();
  }

  void initSharedPreferences() async {
    pref = await SharedPreferences.getInstance();
  }

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  String currentUserName = "";

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.isSignInWithEmailLink(widget.link)) {
      authWithEmailAndLink();
    }
    emailController.text = "isip_n.a.kabanov@mpt.ru";
    passwordController.text = "123!Qwe!";

    if (currentUserName == "") {
      setUserNameForCurrentUser();
      this.context.read<CurrentUserInfoCubit>().onLoad(currentUserName);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          BlocBuilder<CurrentUserInfoCubit, CurrentUserInfoState>(
            builder: (context, state) {
              if (state is CurrentUserInfo) {
                currentUserName = state.userName;
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text(pref!.getString("userName") ?? "Вы не авторизированы"),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Email"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Password"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    authWithEmailAndPassword(
                        emailController.text, passwordController.text);
                  },
                  child: const Text("Войти")),
              ElevatedButton(
                  onPressed: () {
                    authAnonymously();
                  },
                  child: Text("Анонимная авторизация")),
              ElevatedButton(
                  onPressed: () {
                    authWihtEmailLink(emailController.text);
                  },
                  child: Text("Отправить ссылку")),
              ElevatedButton(
                  onPressed: () {
                    exitUser();
                  },
                  child: Text("Выход"))
            ],
          ),
        ]),
      ),
    );
  }
}
