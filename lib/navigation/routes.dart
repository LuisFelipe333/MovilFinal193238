import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Login/Login.dart';
import '../Login/sesion.dart';
import '../Loss_password.dart';
import '../Register/register.dart';
import '../inside_view.dart';
import '../splash/splas_view.dart';

class Routes{
  static const splash = '/';
  static const login = '/login';
  static const register = '/register';
  static const lossPass = '/loss_password';
  static const sesion = '/sesion';
  static const insideView = '/inside_view';

  static Route routes(RouteSettings routeSettings){
    //print('Route name: ${routeSettings.name}');

    switch (routeSettings.name) {
      case splash:
        return _buildRoute(SplashView.create);
      case insideView:
        return _buildRoute(InsideView.create);
      case login:
        return _buildRoute(Login.create);
      case register:
        return _buildRoute(RegisterPage.create);
      case lossPass:
        return _buildRoute(LossPass.create);
      case sesion:
        return _buildRoute(Sesion.create);
      default:
        throw Exception('Route does not exists');
    }
  }
  static MaterialPageRoute _buildRoute(Function build) => MaterialPageRoute(builder: (context) => build(context));
}