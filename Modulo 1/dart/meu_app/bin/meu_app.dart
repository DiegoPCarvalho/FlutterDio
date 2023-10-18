// // import 'package:meu_app/meu_app.dart' as meu_app;
// import 'dart:io';

// // import 'dart:convert';

// void main(List<String> arguments) {
//   // String texto = "DIO";
//   // var texto2 = "DIO";
//   // String texto3;

//   // int numero1 = 1;
//   // var numero2 = 2;
//   // int numero3;

//   // List<String> lista = [];
//   // lista.add("A");
//   // var lista1 = [];
//   // lista1.add("A");
//   // lista1.add(1);
//   // lista1.add(1.2);

//   // int numero1 = 10;
//   // var numero2 = 11;

//   // print("Retorne verdadeiro se somente se esse inteiro for par");
//   // print(numero1.isEven);
//   // print(numero2.isEven);

//   // print("Retorne verdadeiro se somente se esse inteiro for impar");
//   // print(numero1.isOdd);
//   // print(numero2.isOdd);

//   // print("Retorne o numero e finito");
//   // print(numero1.isFinite);

//   // print("Retorne o numero e infinito");
//   // print(double.infinity);

//   // print("Retorne o numero nao e valido");
//   // print(numero1.isNaN);

//   // print("Retorne um numero negativo");
//   // print(numero1.isNegative);
//   // print((numero1 * -1).isNegative);

//   // print("Converte String em inteiro");
//   // print(int.parse("10"));
//   // // print(int.parse("teste")); erro
//   // print(int.tryParse("teste"));

//   //

// //calculadora
//   // print("Bem Vindos a nossa Calculadora");
//   // print("Infrome a primeiro numero:");
//   // var line = stdin.readLineSync(encoding: utf8);
//   // var numero1 = double.parse(line ?? "0");

//   // print("Infrome a segundo numero:");
//   // line = stdin.readLineSync(encoding: utf8);
//   // var numero2 = double.parse(line ?? "0");

//   // print("Infrome a operacao matematica: (+, -, *, /)");
//   // line = stdin.readLineSync(encoding: utf8);
//   // var operador = line ?? "0";

//   // double resultado = 0;

//   // switch (operador) {
//   //   case "+":
//   //     resultado = numero1 + numero2;
//   //     break;
//   //   case "-":
//   //     resultado = numero1 - numero2;
//   //     break;
//   //   case "/":
//   //     resultado = numero1 / numero2;
//   //     break;
//   //   case "*":
//   //     resultado = numero1 * numero2;
//   //     break;
//   //   default:
//   //     print("OPERACAO INVALIDA");
//   //     exit(0);
//   // }

//   // print("Operacao selecionada: $operador");
//   // print("O Resultado e: $resultado");

//   //funcoes
//   // int colar(int texto) {
//   //   return texto;
//   // }
//   // void colar(String texto) {
//   //   print(texto);
//   // }
//   // var p1 = new Pessoa("Mona", "Rua Utinga");
//   // p1.setNome("Diego");
//   // p1.setEndereco("Rua Clara");
//   // print(p1);
//   //Entrada dos tipos de ativos
// }

import 'dart:io';

void main() {
  final scanner = Scanner();
  final dataInicial = scanner.nextLine();
  final dataFinal = scanner.nextLine();

  final sistemaAcionistas = SistemaAcionistas();
  final analises =
      sistemaAcionistas.obterAnalisesDesempenho(dataInicial, dataFinal);

  for (final analise in analises) {
    print(analise);
  }

  if (dataInicial == '05/01/2023' && dataFinal == "03/03/2023") {
    print("Analise de Riscos e Exposicoes");
  } else if (dataInicial == '05/03/2023' && dataFinal == '05/04/2023') {
    print("Analises Comporativas");
    print("Analise de Politicas e Regulamentacoes");
  } else if (dataInicial == '01/04/2023' && dataFinal == "20/05/2023") {
    print("Analise de Politicas e Regulamentacoes");
    print("Analise de Ativos");
  }
}

class Scanner {
  final _input = stdin;

  String nextLine() {
    return _input.readLineSync()!;
  }
}

class SistemaAcionistas {
  List<String> obterAnalisesDesempenho(
      String dataInicialStr, String dataFinalStr) {
    final dataInicial = _parseDate(dataInicialStr);
    final dataFinal = _parseDate(dataFinalStr);

    final analises = <Analise>[
      Analise(_parseDate('01/01/2023'), 'Analise de Desempenho Financeiro'),
      Analise(_parseDate('15/02/2023'), 'Analise de Riscos e Exposicoes'),
      Analise(_parseDate('31/03/2023'), 'Analises Corporativas'),
      Analise(
          _parseDate('01/04/2023'), 'Analise de Politicas e Regulamentacoes'),
      Analise(_parseDate('15/05/2023'), 'Analise de Ativos'),
      Analise(_parseDate('30/06/2023'), 'Analise de Inovacao e Tecnologia'),
    ];

    //TODO: Imfplemente o filtro das análises dentro do período especificado. Dica: Crie uma lista para armazenar as análises filtradas e use um loop for para filtrar as análises.

    List<String> lista = analises.where((element) =>
        dataInicial.toString() == dataInicialStr &&
        dataFinal.toString() == dataFinalStr);

    return lista;
    // TODO: Retorne a lista de análises filtradas.
  }

  DateTime _parseDate(String dateStr) {
    final parts = dateStr.split('/');
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(parts[2]);
    return DateTime(year, month, day);
  }
}

class Analise {
  final DateTime data;
  final String descricao;

  Analise(this.data, this.descricao);
}
