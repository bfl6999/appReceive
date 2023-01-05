import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Utils.dart';


class ForgotPassword extends StatefulWidget{
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}
class _ForgotPasswordState extends State<ForgotPassword>{
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Scaffold(

          appBar: AppBar(
            title: const Text('Recuperar Contraseña'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                //Image.network(
                  //  "https://st.depositphotos.com/1016440/2534/i/950/depositphotos_25344733-stock-photo-sunrise-at-the-beach.jpg"),
                //Image.network("https://i.pinimg.com/550x/d9/05/63/d90563d4c01efc682f74db9c815ff831.jpg"),
                const SizedBox(
                  height: 20,
                ),

                TextFormField(
                  //inputFormatters: [loginMask],
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined), // <-- left icon
                      hintText: "correo",
                      border: InputBorder.none),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email) ?
                          'Introduce un correo válido':
                          null,
                ),
                const SizedBox(
                  height: 20,
                ),

                ElevatedButton.icon(
                  //child: const Text("Resetear contraseña"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  icon: const Icon(
                    Icons.email_outlined,
                    size: 32,
                  ),
                  label: const Text(
                    'Restablecer contraseña',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: verificarEmail,
                  //onPressed: () {
                  //Navigator.push(conte, MaterialPageRoute(builder: (context) => const FormaFormulario()),);
                  //}
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );

  Future verificarEmail() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());

      Utils.showSnackBar('Se envío un correo para restablecer su contraseña');
      Navigator.of(context).popUntil((route) => route.isFirst);

    } on FirebaseAuthException catch (e) {
      print (e);

      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}

