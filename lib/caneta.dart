class Caneta {
  
  String modelo;
  String cor;
  double ponta;
  int    carga;
  bool   tampada;
  int?   anoLancamento;

  // Construtor default
  Caneta()
      : modelo = "bic",
        cor = "azul",
        ponta = 0.7,
        carga = 100,
        tampada = true {
    carga = carga - 2;
  }

  // Construtor nomeado com parâmetros obrigatórios
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

  // Construtor com parâmetros opcionais NOMEADOS
  Caneta.roxa({required this.modelo, required this.carga, this.ponta = 0.7})
      : cor = "Roxa",
        tampada = false {
    carga = carga - 2;
  }
   
  // Define o método tampar
  void tampar() {
    tampada = true; // Define o estado da caneta como tampada
  }

  // Define o método destampar
  void destampar() {
    tampada = false; // Define o estado da caneta como destampada
  }

  // Converte a cor (concordando com "caneta", feminino) para a forma
  // masculina, usada para concordar com "rabisco".
  String get _corMasculina {
    switch (cor.toLowerCase()) {
      case "vermelha":
        return "vermelho";
      case "preta":
        return "preto";
      case "roxa":
        return "roxo";
      default:
        return cor.toLowerCase();
    }
  }

  String rabiscar() {
    // Verifica se a caneta está tampada
    if (tampada) {
      return "A caneta $cor está tampada e não pode rabiscar.";
    }
    // Verifica se a carga da caneta é igual a zero
    if (carga == 0) {
      return "A caneta $cor está sem carga e não pode rabiscar.";
    }
    // Caso contrário, a caneta consegue rabiscar
    return "Rabisco $_corMasculina feito com sucesso!";
  }
}

Caneta caneta  = Caneta();
Caneta canetaVermelha = Caneta.vermelha("Luxor", 0.7, 50)
  ..anoLancamento = 2024;

Caneta canetaPreta1 = Caneta.preta("bic");
Caneta canetaPreta2 = Caneta.preta("Luxor", 0.7);
Caneta canetaPreta3 = Caneta.preta("Deluxe", 0.9, 50);

Caneta canetaRoxa1 = Caneta.roxa(modelo: "Premium", carga: 60);
Caneta canetaRoxa2 = Caneta.roxa(modelo: "Exclusive", carga: 40, ponta: 0.9);
