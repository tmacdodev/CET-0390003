import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.purple),
      home: const CurrencyConverterScreen(title: 'Conversor de Moeda'),
    );
  }
}

class CurrencyConverterScreen extends StatefulWidget {
  final String title;

  const CurrencyConverterScreen({super.key, required this.title});

  @override
  State<CurrencyConverterScreen> createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  TextEditingController _controllerReais = TextEditingController();
  double _cotacao = 5.0;
  double _taxaExtra = 2.0;
  double _resultado = 0.0;
  double _resultadoTaxaExtra = 0.0;

  void _converter() {
    setState(() {
      double reais = double.tryParse(_controllerReais.text) ?? 0.0;
      _resultado = reais / _cotacao;
      _resultadoTaxaExtra = reais / _taxaExtra;
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
              controller: _controllerReais,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valor em Reais',
              ),
            ),
            Slider(
              min: 1,
              max: 10,
              value: _cotacao,
              onChanged: (double valor) {
                setState(() {
                  _cotacao = valor;
                });
              },
            ),

            Text('Cotacao: ${_cotacao.toStringAsFixed(2)}'),
            Text(
              'Valor em Dólar: ${_resultado.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Slider(
              min: 1,
              max: 10,
              divisions: 90,
              value: _taxaExtra,
              onChanged: (double valor) {
                setState(() {
                  _taxaExtra = valor;
                });
              },
            ),
            Text('Taxa Extra: ${_taxaExtra.toStringAsFixed(2)}'),
            Text(
              'Dólar Taxa Extra: ${_resultadoTaxaExtra.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _converter,
        tooltip: 'Converter de Reais para Dólar',
        child: const Icon(Icons.attach_money),
      ),
    );
  }
}
