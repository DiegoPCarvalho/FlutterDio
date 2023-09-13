// import 'package:meu_app/meu_app.dart' as meu_app;
import 'dart:io';

// import 'dart:convert';

void main(List<String> arguments) {
  // String texto = "DIO";
  // var texto2 = "DIO";
  // String texto3;

  // int numero1 = 1;
  // var numero2 = 2;
  // int numero3;

  // List<String> lista = [];
  // lista.add("A");
  // var lista1 = [];
  // lista1.add("A");
  // lista1.add(1);
  // lista1.add(1.2);

  // int numero1 = 10;
  // var numero2 = 11;

  // print("Retorne verdadeiro se somente se esse inteiro for par");
  // print(numero1.isEven);
  // print(numero2.isEven);

  // print("Retorne verdadeiro se somente se esse inteiro for impar");
  // print(numero1.isOdd);
  // print(numero2.isOdd);

  // print("Retorne o numero e finito");
  // print(numero1.isFinite);

  // print("Retorne o numero e infinito");
  // print(double.infinity);

  // print("Retorne o numero nao e valido");
  // print(numero1.isNaN);

  // print("Retorne um numero negativo");
  // print(numero1.isNegative);
  // print((numero1 * -1).isNegative);

  // print("Converte String em inteiro");
  // print(int.parse("10"));
  // // print(int.parse("teste")); erro
  // print(int.tryParse("teste"));

  //

//calculadora
  // print("Bem Vindos a nossa Calculadora");
  // print("Infrome a primeiro numero:");
  // var line = stdin.readLineSync(encoding: utf8);
  // var numero1 = double.parse(line ?? "0");

  // print("Infrome a segundo numero:");
  // line = stdin.readLineSync(encoding: utf8);
  // var numero2 = double.parse(line ?? "0");

  // print("Infrome a operacao matematica: (+, -, *, /)");
  // line = stdin.readLineSync(encoding: utf8);
  // var operador = line ?? "0";

  // double resultado = 0;

  // switch (operador) {
  //   case "+":
  //     resultado = numero1 + numero2;
  //     break;
  //   case "-":
  //     resultado = numero1 - numero2;
  //     break;
  //   case "/":
  //     resultado = numero1 / numero2;
  //     break;
  //   case "*":
  //     resultado = numero1 * numero2;
  //     break;
  //   default:
  //     print("OPERACAO INVALIDA");
  //     exit(0);
  // }

  // print("Operacao selecionada: $operador");
  // print("O Resultado e: $resultado");

  //funcoes
  // int colar(int texto) {
  //   return texto;
  // }
  // void colar(String texto) {
  //   print(texto);
  // }
  // var p1 = new Pessoa("Mona", "Rua Utinga");
  // p1.setNome("Diego");
  // p1.setEndereco("Rua Clara");
  // print(p1);
  //Entrada dos tipos de ativos

  double valor = double.parse(stdin.readLineSync()!);

  String vln = valor.toStringAsFixed(2);

  if (valor > 0) {
    //TODO: Imprimir a mensagem de sucesso, formatando o saldo atual (vide Exemplos).
    print("Deposito realizado com sucesso! Saldo atual: R\$ $vln ");
  } else if (valor == 0) {
    //TODO: Imprimir a mensagem de valor inválido.
    print("Encerrando o programa...");
  } else {
    //TODO: Imprimir a mensagem de encerrar o programa.
    print("Valor invalido! Digite um valor maior que zero.");
  }
}
