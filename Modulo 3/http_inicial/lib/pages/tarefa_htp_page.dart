import 'package:flutter/material.dart';
import 'package:trilhapp/repositories/back4app/tarefas_back4app_repository.dart';

import '../../model/tarefas_back4app_model.dart';

class TarefaHttpPage extends StatefulWidget {
  const TarefaHttpPage({Key? key}) : super(key: key);

  @override
  State<TarefaHttpPage> createState() => _TarefaHttpPageState();
}

class _TarefaHttpPageState extends State<TarefaHttpPage> {
  TarefasBack4AppRepository tarefaRepository = TarefasBack4AppRepository();
  var _tarefasBack4App = TarefasBack4AppModel([]);
  var descricaoContoller = TextEditingController();
  var apenasNaoConcluidos = false;
  var carregando = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    setState(() {
      carregando = true;
    });
    _tarefasBack4App = await tarefaRepository.obterTarefas(apenasNaoConcluidos);
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Tarefa HTTP",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            backgroundColor: Colors.orange,
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              descricaoContoller.text = "";
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      title: const Text("Adicionar tarefa"),
                      content: TextField(
                        controller: descricaoContoller,
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancelar")),
                        TextButton(
                            onPressed: () async {
                              await tarefaRepository.criar(
                                  Tarefa.criar(descricaoContoller.text, false));
                              Navigator.pop(context);
                              obterTarefas();
                              setState(() {});
                            },
                            child: const Text("Salvar"))
                      ],
                    );
                  });
            },
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Não Concluídos",
                        style: TextStyle(fontSize: 18),
                      ),
                      Switch(
                          value: apenasNaoConcluidos,
                          onChanged: (bool value) {
                            apenasNaoConcluidos = value;
                            obterTarefas();
                          })
                    ],
                  ),
                ),
                carregando
                    ? const CircularProgressIndicator()
                    : Expanded(
                        child: ListView.builder(
                            itemCount: _tarefasBack4App.tarefa.length,
                            itemBuilder: (BuildContext bc, int index) {
                              var tarefa = _tarefasBack4App.tarefa[index];
                              return Dismissible(
                                onDismissed:
                                    (DismissDirection dismissDirection) async {
                                  await tarefaRepository
                                      .remover(tarefa.objectId);
                                  obterTarefas();
                                },
                                key: Key(tarefa.descricao),
                                child: ListTile(
                                  title: Text(tarefa.descricao),
                                  trailing: Switch(
                                    onChanged: (bool value) async {
                                      tarefa.concluido = value;
                                      await tarefaRepository.atualizar(tarefa);
                                      obterTarefas();
                                    },
                                    value: tarefa.concluido,
                                  ),
                                ),
                              );
                            }),
                      ),
              ],
            ),
          )),
    );
  }
}
