import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Primeiro App',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        backgroundColor: Colors.yellow[50],
        appBar: AppBar(title: Text('Meu App TmMacDev')),
        body: Center(
          child: Text('Hello, World com classe!'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
