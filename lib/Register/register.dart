import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:final193238/style/colors/colors_views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final193238/repository/auth_repository.dart';

import '../bloc/auth_cubit.dart';
class RegisterPage extends StatefulWidget {
  static Widget create(BuildContext context) => RegisterPage();
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    bool _value = false;

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
            Navigator.pushNamed(context, '/login');
          },
        ),
        title: const Text('Regístrate'),
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
            padding: EdgeInsets.only(right: 20.0,top: 30.0,left: 20.0),
            child: Text(
              'Crea una cuenta nueva para empezar a usar la app',
              style: TextStyle(
                color: Color.fromARGB(255, 117, 113, 113),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                    right: 310,
                      left: 20.0
                  ),
                  child: Text(
                    'Nombre',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle:
                      const TextStyle(color: ColorsViews.textSubtitle),
                      hintText: "Nombre completos",
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
                    top: 20,
                    bottom: 10,
                      right: 235,
                      left: 20.0
                  ),
                  child: Text(
                    'Correo electronico',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 15.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle:
                      TextStyle(color: Color.fromARGB(255, 161, 161, 161)),
                      hintText: "Direccion de correo",
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
                    top: 20,
                    bottom: 10,
                    left: 20.0,
                      right: 285

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
                  padding: const EdgeInsets.only(left: 20.0, right: 15.0),
                  child: TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    obscureText:
                    !_passwordVisible, //This will obscure text dynamically
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
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
                  ),
                ),
                const Padding(
                  padding:
                  EdgeInsets.only(top: 10, left: 35, right: 25, bottom: 15),
                  child: Text(
                    'Las contraseñas deben de contener caracteres, numeros y simbolos con un minimo de 6 caracteres.',
                    style: TextStyle(
                        color: Color.fromARGB(255, 204, 203, 203),
                        fontSize: 15),
                  ),
                ),
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 4, bottom: 4, right: 12)),
                    Checkbox(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      value: _value,
                      onChanged: (v) {
                        setState(() {
                          _value = v!;
                        });
                      },
                    ),
                    Flexible(child: terminos_y_condiciones()),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                Padding(
                  padding: const EdgeInsets.only(top: 140),
                  child: SizedBox(
                    height: 50,
                    width: 350,
                    child: OutlinedButton(
                      onPressed: () {
                        print(_emailController.text);
                        print(_passwordController.text);
                        if (_formKey.currentState?.validate() == true) {
                          print("Enter in the button");
                          context.read<AuthCubit>().createUserWithEmailAndPassword(
                            _emailController.text,
                            _passwordController.text,
                          );
                          //Navigator.pushNamed(context, '/inside_view');
                        }
                      },
                      child: const Text('Crear cuenta',
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55, top: 20),
                  child: Row(
                    children: const [
                      Flexible(
                        child: iniciar_sesion(),
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

class iniciar_sesion extends StatelessWidget {
  const iniciar_sesion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: <InlineSpan>[
          const TextSpan(
            text: '¿Ya tienes una cuenta? ',
            style: TextStyle(color: ColorsViews.textSubtitle, fontSize: 16),
          ),
          TextSpan(
            text: ' Iniciar sesion.',
            style: const TextStyle(
                color: ColorsViews.activeSliderColor, fontSize: 16,fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, '/sesion');
              },
          ),
        ],
      ),
    );
  }
}

class terminos_y_condiciones extends StatelessWidget {
  const terminos_y_condiciones({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(children: <InlineSpan>[
        const TextSpan(
          text: 'Al registrarme, acepto ',
          style: TextStyle(color: ColorsViews.textSubtitle),
        ),
        TextSpan(
          text: ' los terminos y condiciones',
          style: TextStyle(color: ColorsViews.activeSliderColor),
          recognizer: TapGestureRecognizer()..onTap = () {},
        ),
        const TextSpan(
          text: ' y la ',
          style: TextStyle(color: ColorsViews.textSubtitle),
        ),
        TextSpan(
          text: ' politica de privacidad.',
          style: TextStyle(color: ColorsViews.activeSliderColor),
          recognizer: TapGestureRecognizer()..onTap = () {},
        ),
      ]),
    );
  }
}