import 'package:flutter/material.dart';
import 'package:final193238/Login/Login_Content.dart';
import 'package:final193238/Login/Login_UI.dart';
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          LoginUI(),
          Column(children: const<Widget>[
            LoginOption(),
          ]),
        ],
      ),
    );
  }
}