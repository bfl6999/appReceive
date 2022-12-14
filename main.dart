import 'package:flutter/material.dart';
import 'package:my_app/pagina02.dart';
import 'package:my_app/widgets/formulario_formas.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Mostrar debug en la esquina superior
      title: 'Mi App',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Formulario'),
        ),
        body: const FormaFormulario(),

      ),
    );

  }
}
Widget cuerpo (){
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(image: NetworkImage("https://st.depositphotos.com/1016440/2534/i/950/depositphotos_25344733-stock-photo-sunrise-at-the-beach.jpg"),
            fit: BoxFit.cover
        )
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          nombre(),
          login(),
          edad(),
          orientacion(),
          localizacion(),
          const SizedBox(height: 7,), //Cambiar tamaño box para la separación
        ],
      ),
    ),
  );
}

Widget nombre(){
  return Container(
    child: Text(
      "Registrate", style: TextStyle(color: Colors.white,fontSize: 35.0,fontWeight: FontWeight.bold),
      textAlign: TextAlign.start,
    ),
  );
}

Widget orientacion(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: const TextField(
      decoration: InputDecoration(
        hintText: "Sexo: ",
        fillColor: Colors.white,
        filled: true, //Para que este coloreado el fondo
      ),
    ),
  );
}
Container login(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: const TextField(
      decoration: InputDecoration(
        hintText: "Login: ",
        fillColor: Colors.white,
        filled: true, //Para que este coloreado el fondo
      ),
    ),
  );
}

Container edad(){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: Colors.grey),
    ),
    //padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextFormField(
      keyboardType: TextInputType.number,
      //inputFormatters: [dateMask],
      decoration: const InputDecoration(
        hintText: "Edad: ",
        fillColor: Colors.black,
        filled: true, //Para que este coloreado el fondo
      ),
    ),
  );
}

Widget localizacion(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Ubicación dentro del edificio: ",
        fillColor: Colors.black,
        filled: true, //Para que este coloreado el fondo
      ),
    ),
  );
}
//También podemos crearlo en una clase widgets y llamar importando
Widget botonSiguiente(conte){
  return ElevatedButton(

    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
      //foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
    ),

    onPressed: ()=>{
      Navigator.push(conte,
          MaterialPageRoute(builder: (context) => const Pagina02())
      )
    },
    child: Text("Siguiente", style: TextStyle(fontSize: 25, color: Colors.white),),
  );
}
Widget botonmover(conte){    //Es importante pasarle el contexto, y debe estar en un statefull
  return ElevatedButton(
      child: Text("Página Siguiente") ,
      onPressed: (){
        Navigator.push(conte, MaterialPageRoute(builder: (context)=> Pagina02()),
        );
      }
  );
}