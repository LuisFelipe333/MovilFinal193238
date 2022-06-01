import 'package:final193238/inside_view.dart';
import 'package:final193238/repository/implementations/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:final193238/splash/splas_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Login/Login.dart';
import 'Login/sesion.dart';
import 'Loss_password.dart';
import 'Register/register.dart';
import 'bloc/auth_cubit.dart';
import 'navigation/routes.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    );
  final authCubit = AuthCubit(AuthRepository());
  runApp(
    BlocProvider(
      create: (_) => authCubit..init(),
      child: MyApp(),
    ),
  );
}


final _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  static Widget create() {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSignedOut) {
          _navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.splash, (r) => false);
        } else if (state is AuthSignedIn) {
          _navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.insideView, (r) => false);
        }
      },
      child: MyApp(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      title: 'Authentication Flow',
      onGenerateRoute: Routes.routes,
    );
  }
}

