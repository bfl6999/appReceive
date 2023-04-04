import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testfirebase/widgets/formulario_formas.dart';
import 'package:testfirebase/widgets/user_opinion.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'form_model.dart';
import 'form_controller.dart';
import 'user.dart';

class FormularioGoogle extends StatefulWidget {
  const FormularioGoogle({Key? key}) : super(key: key);

  @override
  _FormularioGoogleState createState() => _FormularioGoogleState();
}

enum Ejemplo{
  one(1),
  two(2),
  three(3),
  zero(0),
  lessone(-1),
  lesstwo(-2),
  lessthree(-3);

  const Ejemplo(this.value);
  final int value;
}

late int varAux=0;
late int varAux2=0;

enum Ropa{
  ligera,
  larga,
  abrigada;
}

enum Actividad{
  sedentaria,
  ligera,
  media;
}
Actividad? _actividad = Actividad.ligera;
Ropa? _ropa = Ropa.abrigada;
Ejemplo? _ejemplo = Ejemplo.zero;
//int? _ejemplo2 = Ejemplo.zero.value;


class _FormularioGoogleState extends State<FormularioGoogle> {
  final user = FirebaseAuth.instance.currentUser!;

  late String nombreUser;
  late String horaRegistro;

  //hasta aqui de momento
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        //visualDensity: VisualDensity.adaptivePlatformDensity;
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Formulario Perspectiva"),
        ),
        //body:Container contenedor con el heigh maximo permitido
        body: ListView(
          // No se ve webView para comprobar si se puede ver, tratar de cambiar formato..., puede ser el body, column...
          //height: 500,
          //width: 500,
          //child: Column(
            children: [
              Visibility(
                  visible: false,
                  child: Text(
                    nombreUser = user.email!,
                    semanticsLabel: nombreUser,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              const Text(
                'Cuestionario sobre el confort térmico',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Preguntas breves para conocer el grado de satisfacción de las personas '
                    'con la sensación térmica. Seleccione las respuestas mas de acorde a su situación.',
                style: TextStyle(
                    fontSize: 10, fontWeight: FontWeight.normal,color: Colors.blueGrey),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '1. ¿Se encuentra satisfecho con el ambiente térmico?',
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.normal), textAlign: TextAlign.justify,
              ),
              Column(
                  children: <Widget>[

                    ListTile(
                      title: const Text('Siento mucho calor'),
                      leading: Radio<Ejemplo>(
                        value: Ejemplo.three,
                        groupValue: _ejemplo,
                        onChanged: (Ejemplo? value) {
                          setState(() {
                            _ejemplo = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Siento calor'),
                      leading: Radio<Ejemplo>(
                        value: Ejemplo.two,
                        groupValue: _ejemplo,
                        onChanged: (Ejemplo? value) {
                          setState(() {
                            _ejemplo = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Siento un poco de calor'),
                      leading: Radio<Ejemplo>(
                        value: Ejemplo.one,
                        groupValue: _ejemplo,
                        onChanged: (Ejemplo? value) {
                          setState(() {
                            _ejemplo = value;
                          });
                        },
                      ),
                    ),

                    ListTile(
                      title: const Text('Conforme'),
                      leading: Radio<Ejemplo>(
                        value: Ejemplo.zero,
                        groupValue: _ejemplo,
                        onChanged: (Ejemplo? value) {
                          setState(() {
                            _ejemplo = value;
                          });
                        },
                      ),
                    ),

                    ListTile(
                      title: const Text('Siento un poco de frío'),
                      leading: Radio<Ejemplo>(
                        value: Ejemplo.lessone,
                        groupValue: _ejemplo,
                        onChanged: (Ejemplo? value) {
                          setState(() {
                            _ejemplo = value;
                          });
                        },
                      ),
                    ),

                    ListTile(
                      title: const Text('Siento frío'),
                      leading: Radio<Ejemplo>(
                        value: Ejemplo.lesstwo,
                        groupValue: _ejemplo,
                        onChanged: (Ejemplo? value) {
                          setState(() {
                            _ejemplo = value;
                          });
                        },
                      ),
                    ),

                    ListTile(
                      title: const Text('Siento mucho frío'),
                      leading: Radio<Ejemplo>(
                        value: Ejemplo.lessthree,
                        groupValue: _ejemplo,
                        onChanged: (Ejemplo? value) {
                          setState(() {
                            _ejemplo = value;
                          });
                        },
                      ),
                    ),
                  ]
              ),

              const Text('2. ¿Qué tipo de ropa diría lleva puesta ahora?', textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),),

              const SizedBox(
                height: 10,
              ),

              SizedBox(
                //height: MediaQuery.of(context).size.height*0.50,
                height: 550.0,
                //alignment: Alignment.topLeft,
                //width: MediaQuery.of(context).size.width*0.50,
                width: 300.0,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Expanded(
                        //flex: 33,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      'https://i.pinimg.com/550x/d9/05/63/d90563d4c01efc682f74db9c815ff831.jpg',
                                    ),
                                  ),
                                  ListTile(
                                    title: const Align(
                                      alignment: Alignment(-2.5,0), // Cambiar a todos los Textos por igual
                                      child: Text('Ropa ligera'),
                                    ),

                                    leading: Radio<Ropa>(
                                      value: Ropa.ligera,
                                      //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                                      //visualDensity: const VisualDensity(
                                      //  horizontal: -4.0,
                                      //vertical: 4.0,
                                      //),
                                      groupValue: _ropa,
                                      onChanged: (Ropa? value) {
                                        setState(() {
                                          _ropa = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      'https://i.pinimg.com/550x/d9/05/63/d90563d4c01efc682f74db9c815ff831.jpg',
                                    ),
                                  ),
                                  ListTile(
                                    title: const Align(
                                      alignment: Alignment(-55,0), // Cambiar a todos los Textos por igual
                                      child: Text('Ropa cómoda larga'),
                                    ),
                                    leading: Radio<Ropa>(
                                      value: Ropa.larga,
                                      groupValue: _ropa,
                                      onChanged: (Ropa? value) {
                                        setState(() {
                                          _ropa = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        //flex: 33,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      'https://i.pinimg.com/550x/d9/05/63/d90563d4c01efc682f74db9c815ff831.jpg',
                                    ),
                                  ),
                                  ListTile(
                                    title: const Align(
                                      alignment: Alignment(-8,0), // Cambiar a todos los Textos por igual
                                      child: Text('Ropa abrigada'),
                                    ),
                                    leading: Radio<Ropa>(
                                      value: Ropa.abrigada,
                                      groupValue: _ropa,
                                      onChanged: (Ropa? value) {
                                        setState(() {
                                          _ropa = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Visibility(
                                      visible: false,
                                      child: Expanded(
                                        child: Image.network(
                                          'https://i.pinimg.com/550x/d9/05/63/d90563d4c01efc682f74db9c815ff831.jpg',
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
              const Text('3. ¿Cuál es la actividad mas parecida que realiza?', textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),),

              const SizedBox(
                height: 10,
              ),

              Container(
                //height: MediaQuery.of(context).size.height*0.50,
                height: 550.0,
                //alignment: Alignment.topLeft,
                //width: MediaQuery.of(context).size.width*0.50,
                width: 300.0,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Expanded(
                        //flex: 33,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      'https://i.pinimg.com/550x/d9/05/63/d90563d4c01efc682f74db9c815ff831.jpg',
                                    ),
                                  ),
                                  ListTile(
                                    title: const Align(
                                      alignment: Alignment(-55,0), // Cambiar a todos los Textos por igual
                                      child: Text('Actividad sedentaria'),
                                    ),

                                    leading: Radio<Actividad>(
                                      value: Actividad.sedentaria,
                                      //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Quizas sirva para la primera pregunta // paddings
                                      //visualDensity: const VisualDensity(
                                      //  horizontal: -4.0,
                                      //vertical: 4.0,
                                      //),
                                      groupValue: _actividad,
                                      onChanged: (Actividad? value) {
                                        setState(() {
                                          _actividad = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      'https://i.pinimg.com/550x/d9/05/63/d90563d4c01efc682f74db9c815ff831.jpg',
                                    ),
                                  ),
                                  ListTile(
                                    title: const Align(
                                      alignment: Alignment(-55,0), // Cambiar a todos los Textos por igual
                                      child: Text('Actividad ligera'),
                                    ),
                                    leading: Radio<Actividad>(
                                      value: Actividad.ligera,
                                      groupValue: _actividad,
                                      onChanged: (Actividad? value) {
                                        setState(() {
                                          _actividad = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        //flex: 33,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      'https://i.pinimg.com/550x/d9/05/63/d90563d4c01efc682f74db9c815ff831.jpg',
                                    ),
                                  ),
                                  ListTile(
                                    title: const Align(
                                      alignment: Alignment(-55,0), // Cambiar a todos los Textos por igual
                                      child: Text('Actividad media'),
                                    ),
                                    leading: Radio<Actividad>(
                                      value: Actividad.media,
                                      groupValue: _actividad,
                                      onChanged: (Actividad? value) {
                                        setState(() {
                                          _actividad = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Visibility(
                                      visible: false,
                                      child: Expanded(
                                        child: Image.network(
                                          'https://i.pinimg.com/550x/d9/05/63/d90563d4c01efc682f74db9c815ff831.jpg',
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),

              const SizedBox(
                height: 20,
              ),
              //botonmover(context),
              ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_forward_ios, size: 32),
                  label: const Text(
                    'Enviar opinión',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () {
                    //Guardamos la hora en la que registramos los datos: HH hora formato..min..seg
                    horaRegistro = DateFormat('yyyy-MM-dd HH:mm:ss')
                        .format(DateTime.now());
                    final user = Opiniones(
                      //opinion: int.parse(_ejemplo.value.toString()),
                      //recorrer datos ya de la bdd y comprobarlo con nombreUser -> Si coincide se añade a su documento
                      opinion: int.parse('1'),
                      ropa: _ropa.toString(),
                      //ropa: ropaController.text,
                      //orientacion: variableAux ==0 ? orientacionController.text('Hombre') : orientacionController.text('Mujer'),
                      actividad: _actividad.toString(),
                      //sexo: variableAux == 0 ? 'Hombre' : 'Mujer',
                      //fechaRegistro: horaRegistro,
                    );
                    createUser(user);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FormularioGoogle()),
                    );
                  }),

              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                  //deepPurpleAccent
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                icon: const Icon(Icons.arrow_back_ios, size: 32),
                //Icons.logout_outlined,
                label: const Text(
                  'Cerrar Sesión',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () => FirebaseAuth.instance.signOut(),
              ),

            ]),
      ),
    );
  }
  /*
  Comprobamos si el usuario no esta creado ya en la coleccion Usuarios. Si ya está registrado, añadimos el registro a un nuevo Documento.
  Si no está registrado creamos una nueva Colección con el nombre del correo
   */
  Future createUser(Opiniones user) async {
    // Referenciamos el documento del usuario
    final docUser = FirebaseFirestore.instance
        .collection('users')
        .doc(nombreUser)
        .collection(nombreUser)
        .doc(nombreUser)
        .collection(nombreUser) // Probar si funciona, añadimos collecion y documentos
        .doc(horaRegistro);
    // Referencia a la colección del usuario del que iniciamos sesion
    CollectionReference ref = FirebaseFirestore.instance
        .collection('Users')
        .doc(nombreUser)
        .collection(nombreUser)
        .doc(nombreUser)
        .collection(nombreUser);
    try {
      // Try catch
      QuerySnapshot colec =
      await ref.get(); // Capturamos la colección en el objeto colec
      if (colec.docs.isEmpty) {
        //if(colec.docs.length == 0){
        user.id = docUser.id;
        final json = user.toJson();
        // Creamos el documento y lo escribimos en la base de datos
        await docUser.set(json);
      } else {
        //añadir en misma coleccion con otro documento
        user.id = ref.id;
        final json = user.toJson();
        // Creamos el documento y lo escribimos en la base de datos
        await docUser.update(json);
      }
    } catch (e) {
      const Text('Algo salio mal');
    }
  }
}
