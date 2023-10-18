// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:trilhapp/model/configuracoes_model.dart';
import 'package:trilhapp/repositories/configuracoes_repository.dart';

class ConfiguracaoPageHive extends StatefulWidget {
  const ConfiguracaoPageHive({super.key});

  @override
  State<ConfiguracaoPageHive> createState() => _ConfiguracaoPageHiveState();
}

class _ConfiguracaoPageHiveState extends State<ConfiguracaoPageHive> {
  late ConfiguracoesRepository configuracoesRepository;
  ConfiguracoesModel configuracoesModel = ConfiguracoesModel.vazio();

  var usuarioController = TextEditingController();
  var alturaController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();

    setState(() {
      usuarioController.text = configuracoesModel.nomeUsuario;
      alturaController.text = configuracoesModel.altura.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Configuracao Hive",
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
                value: configuracoesModel.notificacoes,
                onChanged: (bool value) {
                  setState(() {
                    configuracoesModel.notificacoes =
                        !configuracoesModel.notificacoes;
                  });
                }),
            SwitchListTile(
                title: const Text("Tema Escuro"),
                value: configuracoesModel.temaEscuro,
                onChanged: (bool value) {
                  setState(() {
                    configuracoesModel.temaEscuro = value;
                  });
                }),
            TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    configuracoesModel.altura =
                        double.parse(alturaController.text);
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
                  configuracoesModel.nomeUsuario = usuarioController.text;
                  configuracoesRepository.salvar(configuracoesModel);
                  Navigator.pop(context);
                },
                child: const Text("Salvar"))
          ],
        ),
      ),
    ));
  }
}
