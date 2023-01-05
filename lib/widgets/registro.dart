import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../Utils.dart';
import '../main.dart';
import 'formulario_formas.dart';

class Registro extends StatefulWidget {
  final VoidCallback onClickedSignIn;

  const Registro({Key? key, required this.onClickedSignIn}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:
            false, //Mostrar debug en la esquina superior
        title: 'Mi App',
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Registro'),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.network(
                      "https://st.depositphotos.com/1016440/2534/i/950/depositphotos_25344733-stock-photo-sunrise-at-the-beach.jpg"),
                  //Image.network("https://i.pinimg.com/550x/d9/05/63/d90563d4c01efc682f74db9c815ff831.jpg"),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    //inputFormatters: [loginMask],
                    controller: emailController,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Introduc un correo electrónico válido'
                            : null,
                    //keyboardType: TextInputType.emailAddress,
                    //style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined), // <-- left icon
                        hintText: "correo",
                        border: InputBorder.none),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    //inputFormatters: [loginMask],
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 6
                        ? 'Contraseña mínima de 6 caracteres'
                        : null,
                    decoration: const InputDecoration(
                        prefixIcon:
                            Icon(Icons.lock_outline_rounded), // <-- left icon
                        hintText: "contraseña",
                        border: InputBorder.none),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    //child: const Text("Iniciar sesioón"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    icon: const Icon(
                      Icons.lock_open,
                      size: 32,
                    ),
                    label: const Text(
                      'Registrarse',
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: signUp,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                      text: '¿Ya tienes una cuenta?  ',
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignIn,
                          text: 'Iniciar Sesion',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
    //Navigator context no funciona
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

Widget botonForm(conte) {
  //Es importante pasarle el contexto, y debe estar en un statefull
  return ElevatedButton(
      child: const Text("Registrarse"),
      onPressed: () {
        Navigator.push(
          conte,
          MaterialPageRoute(builder: (context) => FormaFormulario()),
        );
      });
}
