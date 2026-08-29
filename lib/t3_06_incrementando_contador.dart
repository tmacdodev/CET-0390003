import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCounterScreen(),
    );
  }
}

class MyCounterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCounterScreenState();
  }
}

class _MyCounterScreenState extends State<MyCounterScreen> {
  int _contador = 0;

  void _incrementaContador() {
    
    _contador = _contador + 1;
    setState(() {});
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Contador Flutter")),
        body: Center(
          child: Text("Contador: $_contador"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementaContador,
          child: Icon(Icons.add),
        ));
  }
}
