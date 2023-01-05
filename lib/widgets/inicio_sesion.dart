import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testfirebase/main.dart';

//import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../Utils.dart';
import 'forgot_password.dart';
import 'registro.dart';
import 'formulario_formas.dart';

class Inicio extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const Inicio({
    Key? key,
    required this.onClickedSignUp
  }) : super(key: key);

  @override
  _Inicio createState() => _Inicio();
}

class _Inicio extends State<Inicio> {
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
            title: const Text('Inicio Sesion'),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(14),
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
                    'Iniciar Sesión',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: signIn,
                  //onPressed: () {
                  //Navigator.push(conte, MaterialPageRoute(builder: (context) => const FormaFormulario()),);
                  //}
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: Text(
                    '¿Te has olvidado la contraseña?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ForgotPassword()
                  )),
                ),
                const SizedBox(
                  height: 20,
                ),

                RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.blueGrey,fontSize: 20),
                      text: '¿No tienes una cuenta?  ',
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignUp,
                          text: 'Registrate',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),),
              ],
            ),
          ),
        ));
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print (e);

      Utils.showSnackBar(e.message);
    }
    //Navigator context no funciona
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

