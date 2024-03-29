import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:testfirebase/widgets/simple_ui_controller.dart';
import 'constants.dart';
import 'formulario_google.dart';
import 'user.dart';
import 'package:intl/intl.dart';

import 'constants.dart';



class FormaFormulario extends StatefulWidget {
  const FormaFormulario({Key? key}) : super(key: key);

  @override
  _FormaFormularioState createState() => _FormaFormularioState();
}

// Máscara que da formato a la edad de los usuarios
var ageMask =
    MaskTextInputFormatter(mask: '##', filter: {"#": RegExp(r'[0-9]')});

//Quitar maybe
var loginMask = MaskTextInputFormatter(mask: '%%%###', filter: {
  "%": RegExp(r'[a-z]'),
  "#": RegExp(r'[0-9]')
}); //, filter: { "%": RegExp(r'[a-z]'),"#": RegExp(r'[0-9]')}

// Enumerador que define el Sexo del usuario
enum Orientacion { hombre, mujer }

class _FormaFormularioState extends State<FormaFormulario> {
  //
  final user = FirebaseAuth.instance
      .currentUser!; // Seleccionamos el usuario Registrado con Firebase Authentication
  final nombreUsuario = TextEditingController(); // maybe quitar
  final edadController = TextEditingController(); // Edad del usuario
  final sexoController = TextEditingController(); // maybe quitar
  //late TextEditingController ubicacionController = TextEditingController();
  final ubicacionController = TextEditingController(); // quitar too
  //final fechaController = TextEditingController();

  late int variableAux =
      0; // variable auxiliar para definir el sexo del usuario
  late String
      nombreUser; // variable donde guardaremos el correo con el que inicia sesión el usuario
  late String
      ubicacionUser; // variable donde guardamos la ubicación actual del usuario
  late String
      horaRegistro; // variable que registra la hora actual que se manda el registro a la base de datos
  late bool ubicacionDefecto;

  // Método para validar los datos que creamos de la clase
  @override
  void dispose() {
    nombreUsuario.dispose();
    edadController.dispose();
    sexoController.dispose();
    ubicacionController.dispose();
    super.dispose();
  }

  // Variable inicial que esta seleccionado de la lista
  String dropdownvalue = 'Nave'; // Desplegable nombre fondo // Asi o antes?
  // Variable inicial que se selecciona por defecto
  Orientacion? _ori = Orientacion.hombre;

  // Lista de los elementos del menú dropdown
  var items = [
    'Nave',
    'Laboratorio 1',
    'Laboratorio 2',
    'Laboratorio 4',
    'Laboratorio 5',
    'Laboratorio 6',
    'Laboratorio 7',
    'Laboratorio 8',
    'Despacho 030',
    'Despacho 050',
    'Despacho 070',
    'Despacho 090',
    'Despacho 110',
    'Cocina',
    'Sala Juntas',
    'Despacho Director'
  ];

  SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          //key: formKey,
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return _buildLargeScreen(size, simpleUIController, theme);
              } else {
                return _buildSmallScreen(size, simpleUIController, theme);
              }
            },
          )),
    );
  }

  /// For large screens
  Widget _buildLargeScreen(Size size, SimpleUIController simpleUIController,
      ThemeData theme) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: RotatedBox(
            quarterTurns: 3,
            child: Lottie.network(
              'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
              height: size.height * 0.3,
              width: double.infinity,
              fit: BoxFit.fill,),
          ),
        ),
        SizedBox(width: size.width * 0.06),
        Expanded(
          flex: 5,
          child: _buildMainBody(size, simpleUIController, theme),
        ),
      ],
    );
  }

  /// For Small screens
  Widget _buildSmallScreen(Size size, SimpleUIController simpleUIController,
      ThemeData theme) {
    return Center(
      child: _buildMainBody(size, simpleUIController, theme),
    );
  }

  /// Main Body
  Widget _buildMainBody(Size size, SimpleUIController simpleUIController,
      ThemeData theme) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Formulario',
                style: kLoginTitleStyle(size),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),

            size.width > 600
                ? Container()
                : Container(
              height: size.height * 0.25,
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: const Icon(
                Icons.heart_broken_outlined,
                //Icons.create_outlined,
                size: 150.0,
                color: Colors.blueAccent,
              ),

            ),

            SizedBox(
              height: size.height * 0.03,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Form(
                  //key: formKey,
                  child: Column(children: [
                    const Visibility(
                        visible: false,
                        child: Text(
                          'Has iniciado sesión con el correo:',
                          style: TextStyle(fontSize: 16),
                        )),
                    Visibility(
                        visible: false,
                        child: Text(
                          nombreUser = user.email!,
                          semanticsLabel: nombreUser,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: edadController,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [ageMask],
                        keyboardType: TextInputType.number, /// Falta aviso de relleno
                        validator: (value) =>  edadController.text == ''
                            ? 'Introduzca su edad'
                            : null,
                        //age !=null ? 'Introduzca su edad': '',
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(
                            hintText: "Edad", border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),

                    Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          //title: const Text('Hombre'),
                          title: const Align(
                            alignment: Alignment(-1.1,0), // Cambiar a todos los Textos por igual
                            child: Text('Hombre'),
                          ),
                          leading: Radio<Orientacion>(
                            value: Orientacion.hombre,
                            visualDensity: const VisualDensity(
                              horizontal: -4.0,
                              ),
                            groupValue: _ori,
                            onChanged: (Orientacion? value) {
                              setState(() {
                                _ori = value;
                                if (_ori == null) {
                                  const Text("");
                                } else {
                                  variableAux = 0;
                                }
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        ListTile(
                          //title: const Text('Mujer'),
                          title: const Align(
                            alignment: Alignment(-1.1,0), // Cambiar a todos los Textos por igual
                            child: Text('Mujer'),
                          ),
                          leading: Radio<Orientacion>(
                            value: Orientacion.mujer,
                            visualDensity: const VisualDensity(
                              horizontal: -4.0,
                            ),
                            groupValue: _ori,
                            onChanged: (Orientacion? value) {
                              setState(() {
                                _ori = value;
                                if (_ori == null) {
                                  const Text("");
                                } else {
                                  variableAux = 1;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: size.height * 0.02,
                    ),

                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                          //padding: const EdgeInsets.only(left: 20.0, right: 20),
                          contentPadding: EdgeInsets.only(left: 20.0, right: 20)),
                      // Initial Value
                      value: dropdownvalue,
                      // Down Arrow Icon
                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: const TextStyle(fontSize: 22.0),
                          ),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      // validator: (value){
                      //   if(value.isEmpty){
                      //     return 'Seleccione una ubicacion"
                      //   }
                      // },
                      onChanged: (String? newValue) {
                        //Avisar para que se seleccione una Ubicacion como en edad
                        setState(() {
                          dropdownvalue = newValue!;
                          //ubicacionController.text = dropdownvalue;

                          //ubicacionUser = dropdownvalue;
                        });
                        //ubicacionUser = dropdownvalue; //Si lo ponemos asi no se le asigna un   valor por defecto
                        ubicacionController.text = dropdownvalue;
                      },
                      validator: (value) =>  ubicacionController.text == 'Nave'
                          ? 'Seleccione una ubicación'
                          : null,
                    ),

                    SizedBox(
                      height: size.height*0.02,
                    ),
                    /// Boton cerrar sesion
                    sendData(theme),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    /// Boton de envío de datos
                    closeSesion(theme),

                  ])),
            ),
          ],
        )
    );
  }

  Widget closeSesion(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
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

    );
  }

// SignUp Button
  Widget sendData(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
          icon: const Icon(Icons.arrow_forward_ios, size: 32),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
            //deepPurpleAccent
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5), /// 15
              ),
            ),
          ),
          label: const Text(
            'Enviar respuesta', // Poner asi o con child Text?
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
            //Guardamos la hora en la que registramos los datos: HH hora formato..min..seg
            horaRegistro = DateFormat('yyyy-MM-dd HH:mm:ss')
                .format(DateTime.now());
            final user = Datos(
              name: nombreUser,
              //recorrer datos ya de la bdd y comprobarlo con nombreUser -> Si coincide se añade a su documento
              age: int.parse(edadController.text),
              //orientacion: variableAux ==0 ? orientacionController.text('Hombre') : orientacionController.text('Mujer'),
              ubicacion: ubicacionController.text,
              sexo: variableAux == 0 ? 'Hombre' : 'Mujer',
              fechaRegistro: horaRegistro,
            );
            createUser(user);

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const FormularioGoogle()),
            );
          }),

    );
  }

  Future createUser(Datos user) async {
    // Referenciamos el documento del usuario
    final docUser = FirebaseFirestore.instance
        .collection('users')
        .doc(nombreUser)
        .collection(nombreUser)
        .doc(nombreUser);// Cambiamos el nombre por horaRegistro para añadir otra collec
    // Referencia a la colección del usuario del que iniciamos sesion
    CollectionReference ref = FirebaseFirestore.instance
        .collection('Users')
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

