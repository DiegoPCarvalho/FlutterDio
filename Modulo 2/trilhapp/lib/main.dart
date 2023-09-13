import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//stl
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 204, 126, 10)),
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}

//stf
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;

  int _gerarNumeroAleatorio() {
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(1000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Meu App")),
      body: Center(child: Text(numeroGerado.toString())),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_alarm),
        onPressed: () {
          setState(() {
            numeroGerado = _gerarNumeroAleatorio();
          });
        },
      ),
    );
  }
}
