import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Meu Primeiro App"),
      ),
      body: Center(
        child: Text(
          "Hello, World",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Função anônima, por enquanto não faz nada
        },
        child: Icon(Icons.add),
      ),
    ),
    theme: ThemeData(
      colorSchemeSeed: Colors.blue,
    ),
  ));
}
