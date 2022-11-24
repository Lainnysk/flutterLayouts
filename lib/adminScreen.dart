import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr2/Screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return AdminScreenState();
  }
}

class AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Вы вошли в систему как администратор."),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Screen()));
                },
                child: const Text("Выйти"))
          ],
        ),
      ]),
    );
  }
}