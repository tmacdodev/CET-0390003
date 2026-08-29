import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Meu Primeiro Widget"),
      ),
      body: Center(
        child: Text(
          "Hello, World",
        ),
      ),
    ),
    theme: ThemeData(
      colorSchemeSeed: Colors.blue,
    ),
  ));
}
