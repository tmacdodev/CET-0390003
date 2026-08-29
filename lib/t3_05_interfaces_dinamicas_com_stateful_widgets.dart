import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyFirstScreen(), 
    );
  }
}
class MyFirstScreen extends StatefulWidget {
  @override
  _MyFirstScreenState createState() {
    return  _MyFirstScreenState();
  }
}
class _MyFirstScreenState extends State<MyFirstScreen> {
  String conteudo = "Valor Inicial";

  void trocaValor(){
    setState((){
        conteudo = "Valor Final";
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meu App')),
      body: Center(
        child: Text(conteudo),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: trocaValor,
        child: Icon(Icons.refresh),
      ),      
    );
  }
}
