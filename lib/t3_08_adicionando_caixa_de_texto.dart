import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blueAccent),
      home: const MyTextInputScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyTextInputScreen extends StatefulWidget {
  final String title;

  const MyTextInputScreen({super.key, required this.title});

  @override
  State<MyTextInputScreen> createState() => _MyTextInputScreenState();
}

class _MyTextInputScreenState extends State<MyTextInputScreen> {
  TextEditingController _controller = TextEditingController();
  String _mensagem = "Hello!";

  void _atualizaTexto() {
    setState(() {
      _mensagem = "Hello, ${_controller.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),
                     backgroundColor : Theme.of(context).colorScheme.primary,
                    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite o seu nome'),
            ),
            Text(
              '$_mensagem',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _atualizaTexto,
        tooltip: 'Faça a saudação',
        child: const Icon(Icons.send),
      ),
    );
  }
}
