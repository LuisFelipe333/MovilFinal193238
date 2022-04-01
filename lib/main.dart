import 'package:flutter/material.dart';
import 'package:final193238/splash/splas_view.dart';

import 'Login/Login.dart';
import 'Login/sesion.dart';
import 'Loss_password.dart';
import 'Register/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const SplashView(),
        '/login' : (context) => const Login(),
        '/sesion' : (context) => const Sesion(),
        '/register': (context) => const RegisterPage(),
        '/loss_password': (context) => const LossPass(),
      },
    );
  }
}

