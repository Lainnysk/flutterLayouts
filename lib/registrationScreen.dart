import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as wgt;
import 'package:pr2/data/model/repositories/auth_repository_impl.dart';
import 'package:pr2/domain/usecases/auth.dart';
import 'package:flutter/material.dart';
import 'package:pr2/adminScreen.dart';
import 'package:pr2/userScreen.dart';
import '../domain/entity/role_entity.dart';
import 'Screen.dart';

class RegistationScreen extends StatefulWidget {
  const RegistationScreen({super.key});

  @override
  wgt.State<StatefulWidget> createState() => RegistationScreenState();
}

class RegistationScreenState extends wgt.State<RegistationScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController loginFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 15, 25, 10),
          child: Center(
              child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: loginFieldController,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(), labelText: 'Login'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите логин';
                          }
                          if (value.length < 5) {
                            return 'Логин содержит не менее 5 символов';
                          }
                          if (value.length > 15) {
                            return 'Логин содержит не более 15 символов';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: passwordFieldController,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Password'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите пароль';
                          }
                          if (value.length < 5) {
                            return 'Пароль содержит не менее 5 символов';
                          }
                          if (value.length > 15) {
                            return 'Пароль содержит не более 15 символов';
                          }
                          if (!value.contains(RegExp(r'[A-Z]'))) {
                            return 'Пароль содержит хотя бы одну заглавную букву';
                          }
                          if (!value
                              .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                            return 'Пароль содержит хотя бы однин спец. символ';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                String login = loginFieldController.text;
                                String password = passwordFieldController.text;

                                Future<Either<String, bool>> result =
                                    AuthRepositoryImpl()
                                        .checkLoginExists(login);
                                bool loginExitsts = false;
                                result.then((value) {
                                  if (value.isRight()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Логин занят.')),
                                    );
                                  } else {
                                    String hashPass = md5
                                        .convert(utf8.encode(password))
                                        .toString();
                                    Future<Either<String, bool>> result =
                                        AuthRepositoryImpl()
                                            .signUp(login, hashPass);

                                    result.then((value) {
                                      if (value.isRight()) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Screen()));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content:
                                                  Text('Registration failed!')),
                                        );
                                      }
                                    });
                                  }
                                });
                              }
                            },
                            child: const Text("Зарегистрироваться")),
                      ),
                      ElevatedButton(
                          onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Screen()))
                              },
                          child: const Text("Назад"))
                    ],
                  ))),
        ),
      ],
    ));
  }
}
