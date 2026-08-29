import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.red),
      home: const ConverterScreen(title: 'Conversor C para F'),
    );
  }
}

class ConverterScreen extends StatefulWidget {
  final String title;

  const ConverterScreen({super.key, required this.title});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  TextEditingController _controllerCelsius = TextEditingController();
  double _resultado = 0.0;

  void _converter() {
    setState(() {
      // Código
      double celsius = double.tryParse(_controllerCelsius.text) ?? 0.0;
      _resultado = (celsius * 9 / 5) + 32;
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
              controller: _controllerCelsius,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite em Celsius',
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
        onPressed: _converter,
        tooltip: 'Efetuar Conversão',
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }
}
