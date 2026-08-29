import 'package:flutter/material.dart';

class Caneta {
  String modelo;
  String cor;
  double ponta;
  int carga;
  bool tampada;

  // Construtor default
  Caneta()
      : modelo = "bic",
        cor = "azul",
        ponta = 0.7,
        carga = 100,
        tampada = true {
    carga = carga - 2;
  }

  Caneta.vermelha(this.modelo, this.ponta, this.carga)
      : cor = "Vermelha",
        tampada = true {
    carga = carga - 2;
  }

  // Construtor nomeado com parâmetros opcionais posicionais
  Caneta.preta(this.modelo, [this.ponta = 0.5, this.carga = 80])
      : cor = "Preta",
        tampada = true {
    carga = carga - 2;
  }

  // Construtor com parâmetros opcionais nomeados
  Caneta.roxa({
    required this.modelo,
    required this.carga,
    this.ponta = 0.7,
  })  : cor = "Roxa",
        tampada = false {
    carga = carga - 2;
  }
}

void main() {
  Caneta c1 = Caneta();
  Caneta cv = Caneta.vermelha("Genérica", 1.2, 50);

  Caneta cp1 = Caneta.preta("Genérica");
  Caneta cp2 = Caneta.preta("Genérica", 1.5);
  Caneta cp3 = Caneta.preta("Genérica", 1.7, 30);

  Caneta cr1 = Caneta.roxa(
    carga: 60,
    modelo: "Premium",
  );
  Caneta cr2 = Caneta.roxa(
    modelo: "Exclusive",
    carga: 40,
    ponta: 0.9,
  );

  runApp(
    MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Meu primeiro App"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${c1.carga}'),
              Text('${cv.cor}'),
              Text('${cp1.modelo} - ${cp1.ponta} - ${cp1.carga}'),
              Text('${cp2.modelo} - ${cp2.ponta} - ${cp2.carga}'),
              Text('${cp3.modelo} - ${cp3.ponta} - ${cp3.carga}'),
              Text('${cr1.modelo} - ${cr1.ponta} - ${cr1.carga}'),
              Text('${cr2.modelo} - ${cr2.ponta} - ${cr2.carga}'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    ),
  );
}
