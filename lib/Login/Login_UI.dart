import 'package:flutter/material.dart';

class LoginUI extends StatelessWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100,),
      child: SizedBox(
        height: 200,
        width: 350,
        child: Image.asset('assets/image/splash.png'),
      ),
    );
  }
}