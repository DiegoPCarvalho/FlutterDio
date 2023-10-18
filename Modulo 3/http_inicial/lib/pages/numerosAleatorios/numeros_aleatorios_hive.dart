import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NumerosAleatoriosPageHive extends StatefulWidget {
  const NumerosAleatoriosPageHive({super.key});

  @override
  State<NumerosAleatoriosPageHive> createState() =>
      _NumerosAleatoriosPageHiveState();
}

class _NumerosAleatoriosPageHiveState extends State<NumerosAleatoriosPageHive> {
  int? numeroGerado;
  int? quantidadeCliques;
  late Box boxNumerosAleatorios;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    if (Hive.isBoxOpen('box_numeros_aleatorios')) {
      boxNumerosAleatorios = Hive.box('box_numeros_aleatorios');
    } else {
      boxNumerosAleatorios = await Hive.openBox('box_numeros_aleatorios');
    }

    setState(() {
      numeroGerado = boxNumerosAleatorios.get('numero_gerado') ?? 0;
      quantidadeCliques = boxNumerosAleatorios.get('quantidade_cliques') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Números Hive",
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
              boxNumerosAleatorios.put('numero_gerado', numeroGerado!);
              boxNumerosAleatorios.put(
                  'quantidade_cliques', quantidadeCliques!);
            }),
      ),
    );
  }
}
