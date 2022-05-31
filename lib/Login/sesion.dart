import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:final193238/style/colors/colors_views.dart';
import 'package:final193238/Login/sesion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_cubit.dart';

class Sesion extends StatefulWidget {
  const Sesion({Key? key}) : super(key: key);

  @override
  State<Sesion> createState() => _Sesion();
}
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _formKey = GlobalKey<FormState>();
class _Sesion extends State<Sesion> {

  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorsViews.txtHeaderColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorsViews.activeSliderColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Iniciar sesión'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4, right: 15),
            child: Image.asset(
              'assets/image/splash.png',
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top:18.0, right:70, bottom:18),
            child: Text(
              'Inicia sesión en tu cuenta para continuar',
              style: TextStyle(
                color: Color.fromARGB(255, 117, 113, 113),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Form(
            child: Column(
              key: _formKey,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 0,
                    right: 230,
                  ),
                  child: Text(
                    'Correo electrónico',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle:
                      TextStyle(color: Color.fromARGB(255, 161, 161, 161)),
                      hintText: "Email Adress",
                      fillColor: Colors.white70,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    right: 280,
                  ),
                  child: Text(
                    'Contraseña',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    obscureText:
                    !_passwordVisible, //This will obscure text dynamically
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        )
                      ),
                      filled: true,
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 161, 161, 161),
                      ),
                      fillColor: Colors.white70,
                      // Here is key idea
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color.fromARGB(255, 179, 179, 179),
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 160, top: 15),
                  child: Row(
                    children: const [
                      Flexible(child: Loss_password()),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 333),
                  child: Boton_Inicio(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55, top: 20),
                  child: Row(
                    children: const [
                      Flexible(
                        child: Registrarse(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

//Clases de los botones

//INGRESAR
class Boton_Inicio extends StatelessWidget {
  const Boton_Inicio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 350,
      child: OutlinedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            context.read<AuthCubit>().signInWithEmailAndPassword(
              _emailController.text,
              _passwordController.text,
            );

          }

          },
        child: const Text('Ingresar',
            style: TextStyle(
                color: ColorsViews.whiteColor,
                fontSize: 18)),
        style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.resolveWith<Color>((states) {
            return ColorsViews.backgroundButtonActiveColor;
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
                (states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.grey;
              }
              return Colors.transparent;
            },
          ),
          shape:
          MaterialStateProperty.resolveWith<OutlinedBorder>(
                (_) {
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25));
            },
          ),
        ),
      ),
    );
  }
}

//Texto de contraseña olvidada
class Loss_password extends StatelessWidget {
  const Loss_password({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.end,
      text: TextSpan(children: <InlineSpan>[
        TextSpan(
          text: '¿Has olvidado tu contraseña?',
          style: const TextStyle(
              color: ColorsViews.activeSliderColor,
              fontSize: 15,
              fontWeight: FontWeight.bold),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.pushNamed(context, '/loss_password');
            },
        ),
      ]),
    );
  }
}

//Texto de registro
class Registrarse extends StatelessWidget {
  const Registrarse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: <InlineSpan>[
          const TextSpan(
            text: '¿Todavia no tienes cuenta? ',
            style: TextStyle(
              color: ColorsViews.textSubtitle,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: ' Regístrate.',
            style: const TextStyle(
              color: ColorsViews.activeSliderColor, fontSize: 16, fontWeight: FontWeight.bold,),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, '/register');
              },
          ),
        ],
      ),
    );
  }
}