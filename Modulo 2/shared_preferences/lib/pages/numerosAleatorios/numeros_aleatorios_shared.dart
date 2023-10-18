import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumerosAleatoriosPageShared extends StatefulWidget {
  const NumerosAleatoriosPageShared({super.key});

  @override
  State<NumerosAleatoriosPageShared> createState() =>
      _NumerosAleatoriosPageSharedState();
}

class _NumerosAleatoriosPageSharedState
    extends State<NumerosAleatoriosPageShared> {
  int? numeroGerado;
  int? quantidadeCliques;
  final chave_numero_aleatorio = "numero_aleatorio";
  final CHAVE_QTD_CLIQUES = "cliques";
  late SharedPreferences storage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    storage = await SharedPreferences.getInstance();

    setState(() {
      numeroGerado = storage.getInt(chave_numero_aleatorio);
      quantidadeCliques = storage.getInt(CHAVE_QTD_CLIQUES);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Números Aleatórios",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.orange,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              numeroGerado == null ? '0' : numeroGerado.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              quantidadeCliques == null ? '0' : quantidadeCliques.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              var random = Random();
              setState(() {
                numeroGerado = random.nextInt(1000);
                quantidadeCliques = (quantidadeCliques ?? 0) + 1;
              });
              storage.setInt(chave_numero_aleatorio, numeroGerado!);
              storage.setInt(CHAVE_QTD_CLIQUES, quantidadeCliques!);
            }),
      ),
    );
  }
}
