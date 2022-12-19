import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();

}class _MainPageState extends State<MainPage> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("Formulario Google Form"),
        actions: [
          IconButton(icon: const Icon(Icons.auto_fix_high),
          onPressed: () async {
            controller.loadUrl('https://aulavirtual.ual.es/?new_loc=%2Fultra%2F');
          },)
        ],
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://docs.google.com/forms/d/e/1FAIpQLSeVgGc1Dgkz9FOfvo9eQ3HOF8kg_H5W6jdh3sVgJ-umY9Tocg/viewform?usp=sf_link',
        onWebViewCreated: (controller){
          this.controller = controller;
      },
      )
    );
  }
