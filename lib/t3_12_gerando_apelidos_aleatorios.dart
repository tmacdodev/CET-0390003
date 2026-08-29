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

  String _generoSelecionado = "Feminino";

  String _nickname = "Seu apelido aparecerá aqui!";

  List _prefixosFemininos = [
    "Super",
    "Mega",
    "Turbo",
    "Incrível",
    "Misteriosa",
    "Destemida",
    "Veloz",
    "Forte"
  ];

  List _prefixosMasculinos = [
    "Super",
    "Mega",
    "Turbo",
    "Incrível",
    "Misterioso",
    "Destemido",
    "Veloz",
    "Forte",
  ];

  List _sufixosMasculinos = [
    "Poderoso",
    "Valente",
    "Vaidoso",
    "Imbatível",
    "Implacável",
    "Sorridente",
    "Feroz",
  ];

  List _sufixosFemininos = [
    "Poderosa",
    "Valente",
    "Vaidosa",
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
        nome = "Tathiana";
      }

      List prefixos = _generoSelecionado == "Feminino"
          ? _prefixosFemininos
          : _prefixosMasculinos;
      List sufixos = _generoSelecionado == "Feminino"
          ? _sufixosFemininos
          : _sufixosMasculinos;

      int indicePrefixo = _random.nextInt(prefixos.length);
      int indiceSufixo = _random.nextInt(sufixos.length);

      _nickname = prefixos[indicePrefixo] + " " + nome + " " + sufixos[indiceSufixo];
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

            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              initialValue: _generoSelecionado,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Gênero',
              ),
              items: ['Feminino', 'Masculino']
                  .map((genero) =>
                      DropdownMenuItem(value: genero, child: Text(genero)))
                  .toList(),
              onChanged: (valor) {
                setState(() {
                  _generoSelecionado = valor!;
                });
              },
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
        child: const Icon(Icons.fluorescent_rounded),
      ),
    );
  }
}
