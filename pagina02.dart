import 'package:flutter/material.dart';

class Pagina02 extends StatelessWidget{
  const Pagina02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuestionario"),
      ),
      body: Column(
        children: [
          Text("Términos y condiciones:", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10,),
          Text("Estos Términos y Condiciones de Uso regulan las reglas a que se sujeta la utilización de la AP"
              "(en adelante, la APP), que puede descargarse desde el dominio La descarga o utilización de la APP "
              "atribuye la condición de Usuario a quien lo haga e implica la aceptación de todas las condiciones "
              "incluidas en este documento y en la Política de Privacidad y el Aviso Legal de dicha página Web. "
              "El Usuario debería leer estas condiciones cada vez que utilice la APP, ya que podrían ser modificadas en lo sucesivo",
          style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10,),
          Text("Estos Términos y Condiciones de Uso regulan las reglas a que se sujeta la utilización de la AP"
              "(en adelante, la APP), que puede descargarse desde el dominio La descarga o utilización de la APP "
              "atribuye la condición de Usuario a quien lo haga e implica la aceptación de todas las condiciones "
              "incluidas en este documento y en la Política de Privacidad y el Aviso Legal de dicha página Web. "
              "El Usuario debería leer estas condiciones cada vez que utilice la APP, ya que podrían ser modificadas en lo sucesivo",
            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10,),
          Text("Estos Términos y Condiciones de Uso regulan las reglas a que se sujeta la utilización de la AP"
              "(en adelante, la APP), que puede descargarse desde el dominio La descarga o utilización de la APP "
              "atribuye la condición de Usuario a quien lo haga e implica la aceptación de todas las condiciones "
              "incluidas en este documento y en la Política de Privacidad y el Aviso Legal de dicha página Web. "
              "El Usuario debería leer estas condiciones cada vez que utilice la APP, ya que podrían ser modificadas en lo sucesivo",
            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
          ),
          botonAceptar(context)
        ],
      ),
    );
  }
}

Widget botonAceptar(conte){    //Es importante pasarle el contexto, y debe estar en un statefull
  return ElevatedButton(

      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        //backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
        //foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Aceptar todo",style: TextStyle(fontSize: 20),),
          Icon(Icons.arrow_forward_ios)
        ],
      ) ,
      onPressed: ()=>{
        Navigator.pop(conte)
      }
  );
}
