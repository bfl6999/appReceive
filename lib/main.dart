import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testfirebase/widgets/auth.dart';
//import 'package:testfirebase/widgets/formulario_formas.dart';
import 'package:testfirebase/widgets/home_page.dart';
//import 'package:testfirebase/widgets/home_page.dart';
import 'package:testfirebase/widgets/inicio_sesion.dart';

import 'Utils.dart';
//import 'package:testfirebase/widgets/registro.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
  }
  class MainPage extends StatelessWidget{
  @override
    Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Algo ha salido mal'),);
        } else if (snapshot.hasData){
          return HomePage() ;
          //return FormaFormulario() ;
        } else {
          return Auth();
        }
    }
    ),
  );
  }