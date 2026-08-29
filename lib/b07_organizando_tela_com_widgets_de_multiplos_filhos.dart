import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Meu Primeiro App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello, World"),
            Text("Texto 1"),
          ],
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
