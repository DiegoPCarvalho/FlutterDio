import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset("imagens/logo.jpg"),
          title: const Text("Usuario"),
          subtitle: const Text("Ola, Tudo bem?"),
          trailing: const Icon(Icons.menu),
        ),
        Image.asset("imagens/logo.jpg"),
        Image.asset("imagens/logo.jpg"),
        Image.asset("imagens/logo.jpg"),
        Image.asset("imagens/logo.jpg"),
        Image.asset("imagens/logo.jpg"),
        Image.asset("imagens/logo.jpg"),
      ],
    );
  }
}
