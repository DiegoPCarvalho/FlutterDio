// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracaoPageShared extends StatefulWidget {
  const ConfiguracaoPageShared({super.key});

  @override
  State<ConfiguracaoPageShared> createState() => _ConfiguracaoPageSharedState();
}

class _ConfiguracaoPageSharedState extends State<ConfiguracaoPageShared> {
  late SharedPreferences storage;
  var usuarioController = TextEditingController();
  var alturaController = TextEditingController();

  String? nomeUsuario;
  double? altura;
  bool receberPushNotification = false;
  bool temaEscuro = false;

  final CHAVE_NOME_USUARIO = "nome_usuario";
  final CHAVE_ALTURA = "altura";
  final CHAVE_RECEBER_NOTIFICACAO = "receber_notificacao";
  final CHAVE_TEMA_ESCURO = "tema_escuro";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      usuarioController.text = storage.getString(CHAVE_NOME_USUARIO) ?? "";
      alturaController.text = (storage.getDouble(CHAVE_ALTURA) ?? 0).toString();
      receberPushNotification =
          storage.getBool(CHAVE_RECEBER_NOTIFICACAO) ?? false;
      temaEscuro = storage.getBool(CHAVE_TEMA_ESCURO) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Configuracao",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: const InputDecoration(hintText: "Nome Usuario"),
                controller: usuarioController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Altura"),
                controller: alturaController,
              ),
            ),
            SwitchListTile(
                title: const Text("Receber Notificacoes"),
                value: receberPushNotification,
                onChanged: (bool value) {
                  setState(() {
                    receberPushNotification = !receberPushNotification;
                  });
                }),
            SwitchListTile(
                title: const Text("Tema Escuro"),
                value: temaEscuro,
                onChanged: (bool value) {
                  setState(() {
                    temaEscuro = value;
                  });
                }),
            TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    await storage.setDouble(
                        CHAVE_ALTURA, double.parse(alturaController.text));
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text("Meu App"),
                            content: const Text(
                                "Por Favor infromar uma altura valida"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Ok"))
                            ],
                          );
                        });
                    return;
                  }
                  await storage.setString(
                      CHAVE_NOME_USUARIO, usuarioController.text);
                  await storage.setBool(
                      CHAVE_RECEBER_NOTIFICACAO, receberPushNotification);
                  await storage.setBool(CHAVE_TEMA_ESCURO, temaEscuro);
                  Navigator.pop(context);
                },
                child: const Text("Salvar"))
          ],
        ),
      ),
    ));
  }
}
