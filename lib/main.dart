import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'caneta.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text(">> Meu Primeiro Widget <<"),
      ),
        body: Builder(
          builder: (context) => Center(
          child: SingleChildScrollView(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Hello, World 29/08/2026"),
              Text("Texto linha 2"),
              Text('Texto linha 3'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Dio().post(
                    "https://tm-cet-aulas-default-rtdb.firebaseio.com/.json",
                    data: {"nome": "T Machado"},
                  );
                },
                child: Text('POST'),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                Dio().put("https://tm-cet-aulas-default-rtdb.firebaseio.com/01/.json",
                    data: {"nome": "Capibaribe"},);
              }, child: Text("PUT")),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      canetaVermelha.destampar();
                    },
                    child: Text("Abrir caneta"),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text(canetaVermelha.rabiscar()),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text("Rabiscar"),
                  ),
                ],
              ),
            ],
            ),
          ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Função anônima, por enquanto não faz nada
          },
          child: Icon(Icons.add),
        ),
      ),
      title: "Meu Primeiro App",
      theme: ThemeData(colorSchemeSeed: Colors.yellowAccent), // Identidade visual do aplicativo
    );
  }
}
