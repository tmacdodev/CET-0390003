import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.greenAccent),
      home: const NicknameGenerator(title: 'Gerador de Apelidos'),
    );
  }
}

class NicknameGenerator extends StatefulWidget {
  final String title;

  const NicknameGenerator({super.key, required this.title});

  @override
  State<NicknameGenerator> createState() => _NicknameGeneratorState();
}

class _NicknameGeneratorState extends State<NicknameGenerator> {
  TextEditingController _nameController = TextEditingController();

  String _nickname = "Seu apelido aparecerá aqui!";

  List _prefixos = [
    "Super",
    "Mega",
    "Turbo",
    "Incrível",
    "Misterioso",
    "Destemido",
    "Veloz",
    "Forte",
  ];

  List _sufixos = [
    "Poderoso",
    "Valente",
    "Vaidoso",
    "Imbatível",
    "Implacável",
    "Sorridente",
    "Feroz",
  ];

  Random _random = Random();

  void _gerarApelido() {
    setState(() {
      String nome = _nameController.text.trim();

      if (nome.isEmpty) {
        nome = "Ulisses";
      }

      int indicePrefixo = _random.nextInt(_prefixos.length);
      int indiceSufixo = _random.nextInt(_sufixos.length);

      _nickname = _prefixos[indicePrefixo] + nome + _sufixos[indiceSufixo];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome do Usuário',
              ),
            ),

            Text(
              '$_nickname',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _gerarApelido,
        tooltip: 'Gerar Apelido',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
