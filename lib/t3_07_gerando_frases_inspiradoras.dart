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
      theme: ThemeData(colorSchemeSeed: Colors.yellow),
      home: const InspirationalQuotes(title: 'Flutter Demo Home Page'),
    );
  }
}

class InspirationalQuotes extends StatefulWidget {
  final String title;

  const InspirationalQuotes({super.key, required this.title});

  @override
  State<InspirationalQuotes> createState() => _InspirationalQuotesState();
}

class _InspirationalQuotesState extends State<InspirationalQuotes> {
  String _fraseAtual = "Clique para receber sua frase inspiradora";

  List _frases = [
    "Acredite em si mesmo",
    "Quem faz o dia bonito é você",
    "Nunca é tarde para começar",
    "O futuro depende do que você aprende hoje",
  ];

  Random _random = Random();

  void _gerarFrase() {
    int indice = _random.nextInt(_frases.length);
    _fraseAtual = _frases[indice];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Frases Inspiradoras"),
                    backgroundColor : Theme.of(context).colorScheme.primary,
                    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_fraseAtual',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _gerarFrase,
        tooltip: 'Gerar frase inspiracional',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
