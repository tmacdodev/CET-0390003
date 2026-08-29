import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.green),
      home: const MySumScreen(title: 'Somar Dois Valores'),
    );
  }
}

class MySumScreen extends StatefulWidget {
  final String title;

  const MySumScreen({super.key, required this.title});

  @override
  State<MySumScreen> createState() => _MySumScreenState();
}

class _MySumScreenState extends State<MySumScreen> {
  TextEditingController _controllerA = TextEditingController();
  TextEditingController _controllerB = TextEditingController();
  int _resultado = 0;

  void _somarValores() {
    setState(() {
      int valorA = int.tryParse(_controllerA.text) ?? 0;
      int valorB = int.tryParse(_controllerB.text) ?? 0;

      _resultado = valorA + valorB;
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
              controller: _controllerA,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valor A',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _controllerB,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valor B',
              ),
            ),
            Text(
              '$_resultado',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _somarValores,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
