import 'package:flutter/material.dart';

class DadosCadastrais extends StatelessWidget {
  final String title;
  final List<String> dados;
  const DadosCadastrais({Key? key, required this.title, required this.dados})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(title),
        ),
        body: Center(
          child: Text(dados.length.toString()),
        ));
  }
}
