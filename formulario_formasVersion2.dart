import 'package:flutter/material.dart';
//import '../pagina02.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'formularioGoogle.dart';


class FormaFormulario extends StatefulWidget {
  const FormaFormulario({Key? key}) : super(key: key);

  @override
  _FormaFormularioState createState() => _FormaFormularioState();
}

enum Orientacion { hombre, mujer }

class _FormaFormularioState extends State<FormaFormulario> {
  // Initial Selected Value
  String dropdownvalue = 'Nave';
  Orientacion? _ori = Orientacion.hombre;
  //int? _selectedValueIndex;
  //List<String> buttonText = ["Hombre", "Mujer"];
  //Orientacion _ori = Orientacion.hombre;
  // List of items in our dropdown menu
  var items = [ 'Nave', 'Laboratorio 1', 'Laboratorio 2', 'Laboratorio 4', 'Laboratorio 5',
    'Laboratorio 6', 'Laboratorio 7', 'Laboratorio 8', 'Laboratorio 9', 'Despacho 030',
    'Despacho 050', 'Despacho 070', 'Despacho 090', 'Sala Juntas'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //decoration: const BoxDecoration(
          //image: DecorationImage(image: NetworkImage("https://st.depositphotos.com/1016440/2534/i/950/depositphotos_25344733-stock-photo-sunrise-at-the-beach.jpg"),
              //fit: BoxFit.cover
          //)
      //),
      child: Column(
        children:[
          //Image.network("https://st.depositphotos.com/1016440/2534/i/950/depositphotos_25344733-stock-photo-sunrise-at-the-beach.jpg"),
          Image.network("https://i.pinimg.com/550x/d9/05/63/d90563d4c01efc682f74db9c815ff831.jpg"),
          const SizedBox(height: 20,),
          input_login(),
          const SizedBox(height: 20,),
          input_age(),
          const SizedBox(height: 20,),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                title: const Text('Hombre'),
                leading: Radio<Orientacion>(
                  value: Orientacion.hombre,
                  groupValue: _ori,
                  onChanged: (Orientacion? value) {
                    setState(() {
                      _ori = value;
                    });
                  },
                ),
              ),

              const SizedBox(height: 1,),
              ListTile(
                title: const Text('Mujer'),
                leading: Radio<Orientacion>(
                  value: Orientacion.mujer,
                  groupValue: _ori,
                  onChanged: (Orientacion? value) {
                    setState(() {
                      _ori = value;
                    });
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 20,),

          DropdownButtonFormField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15.0)
            ),
              // Initial Value
            value: dropdownvalue,

            // Down Arrow Icon
            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items, style: const TextStyle(fontSize: 22.0),),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
          const SizedBox(height: 20,),
          botonmover(context),
      ],
      ),
    );
  }
}
var loginMask = MaskTextInputFormatter(mask: '%%%###', filter: { "%": RegExp(r'[a-z]'),"#": RegExp(r'[0-9]')});
//, filter: { "%": RegExp(r'[a-z]'),"#": RegExp(r'[0-9]')}

Container input_login(){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: Colors.black),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    margin: const EdgeInsets.symmetric(horizontal: 15),
    child: TextFormField(
      inputFormatters: [loginMask],
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 20),
      decoration: const InputDecoration(
          hintText: "Usuario",
          border: InputBorder.none),
    ),
  );
}
var ageMask = MaskTextInputFormatter(mask: '##', filter: { "#": RegExp(r'[0-9]')});

Container input_age(){

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: Colors.black),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    margin: const EdgeInsets.symmetric(horizontal: 15),
    child: TextFormField(
      inputFormatters: [ageMask],
      keyboardType: TextInputType.number,
      style: const TextStyle(fontSize: 20),
      decoration: const InputDecoration(
          hintText: "Edad",
          border: InputBorder.none),
    ),
  );
}

Widget botonmover(conte){    //Es importante pasarle el contexto, y debe estar en un statefull
  return ElevatedButton(
      child: const Text("->") ,
      onPressed: (){
        Navigator.push(conte, MaterialPageRoute(builder: (context)=> MainPage()),
        );
      }
  );
}
