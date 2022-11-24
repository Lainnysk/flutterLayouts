import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr2/adminScreen.dart';
import 'package:pr2/data/model/repositories/auth_repository_impl.dart';
import 'package:pr2/domain/entity/role_entity.dart';
import 'package:pr2/main.dart';
import 'package:pr2/adminScreen.dart';
import 'package:flutter/widgets.dart' as _widgets;
import 'package:pr2/registrationScreen.dart';
import 'package:pr2/userScreen.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  _widgets.State<Screen> createState() => _Screen();
}

class _Screen extends _widgets.State<Screen> {
  TextEditingController loginFieldController = new TextEditingController();
  TextEditingController passwordFieldController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        body: Center(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 15, 25, 10),
          child: Center(
              child: Form(
            key: _formKey,
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
                      border: UnderlineInputBorder(), labelText: 'Password'),
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
                    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                      return 'Пароль содержит хотя бы однин спец. символ';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        String login = loginFieldController.text;
                        String password = passwordFieldController.text;
                        String hashPass =
                            md5.convert(utf8.encode(password)).toString();

                        Future<Either<String, RoleEnum>> result =
                            AuthRepositoryImpl().signIn(login, hashPass);
                        result.then((value) {
                          if (value.isRight()) {
                            RoleEnum enumResult =
                                value.getOrElse(() => RoleEnum.who);
                            switch (enumResult) {
                              case RoleEnum.admin:
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdminScreen()));
                                break;
                              case RoleEnum.user:
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserScreen()));
                                break;
                              default:
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Ваша роль не определена.')),
                                );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Authorization failed!')),
                            );
                          }
                        });
                      }
                    },
                    child: const Text('Войти'),
                  ),
                ),
                ElevatedButton(
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistationScreen()))
                        },
                    child: const Text('Зарегистрироваться'))
              ],
            ),
          )),
        )
      ]),
    ));
  }
}
