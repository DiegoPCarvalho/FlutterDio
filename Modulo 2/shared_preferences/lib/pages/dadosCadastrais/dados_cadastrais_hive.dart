import 'package:flutter/material.dart';
import 'package:trilhapp/model/dados_cadastrais_model.dart';
import 'package:trilhapp/repositories/dados_cadastrais_repositories.dart';
import 'package:trilhapp/repositories/linguagens_repositeries.dart';
import 'package:trilhapp/repositories/nivel_repositories.dart';
import 'package:trilhapp/shared/widgets/text_label.dart';

class DadosCadastraisHive extends StatefulWidget {
  const DadosCadastraisHive({Key? key}) : super(key: key);

  @override
  State<DadosCadastraisHive> createState() => _DadosCadastraisHiveState();
}

class _DadosCadastraisHiveState extends State<DadosCadastraisHive> {
  late DadosCadastraisRepositories dadosCadastraisRepositories;
  var dadosCadastraisModel = DadosCadastraisModel.vazio();
  var nomeController = TextEditingController(text: "");
  var dataNacimentoController = TextEditingController(text: "");
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepositories();
  var niveis = [];
  var linguagens = [];
  bool salvando = false;

  @override
  void initState() {
    // niveis = (nivelRepository.retornaNiveis());
    // linguagens = (linguagensRepository.retornaLinguagens());
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    dadosCadastraisRepositories = await DadosCadastraisRepositories.carregar();
    dadosCadastraisRepositories.obterDados();

    nomeController.text = dadosCadastraisModel.nome ?? "";
    dataNacimentoController.text = dadosCadastraisModel.dataNascimento == null
        ? ""
        : dadosCadastraisModel.dataNascimento.toString();
    setState(() {});
  }

  List<DropdownMenuItem<int>> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(child: Text(i.toString()), value: i));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text("Meus Dados"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: salvando
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    const TextLabel(texto: "Nome"),
                    TextField(
                      controller: nomeController,
                    ),
                    const TextLabel(
                      texto: "Data de Nascimento",
                    ),
                    TextField(
                        controller: dataNacimentoController,
                        readOnly: true,
                        onTap: () async {
                          var data = await showDatePicker(
                              context: context,
                              initialDate: DateTime(2000, 1, 1),
                              firstDate: DateTime(1900, 1, 1),
                              lastDate: DateTime(2023, 10, 23));
                          if (data != null) {
                            dataNacimentoController.text = data.toString();
                            dadosCadastraisModel.dataNascimento = data;
                          }
                        }),
                    const TextLabel(texto: "Nivel de Experiencia"),
                    Column(
                        children: niveis
                            .map(
                              (nivel) => RadioListTile(
                                  dense: true,
                                  title: Text(nivel.toString()),
                                  selected:
                                      dadosCadastraisModel.nivelExp == nivel,
                                  value: nivel.toString(),
                                  groupValue: dadosCadastraisModel.nivelExp,
                                  onChanged: (value) {
                                    setState(() {
                                      dadosCadastraisModel.nivelExp =
                                          value.toString();
                                    });
                                  }),
                            )
                            .toList()),
                    const TextLabel(texto: "Linguagens Preferidas"),
                    Column(
                        children: linguagens
                            .map(
                              (linguagem) => CheckboxListTile(
                                  dense: true,
                                  title: Text(linguagem),
                                  value: dadosCadastraisModel.linguagens
                                      .contains(linguagem),
                                  onChanged: (bool? value) {
                                    if (value!) {
                                      setState(() {
                                        dadosCadastraisModel.linguagens
                                            .add(linguagem);
                                      });
                                    } else {
                                      setState(() {
                                        dadosCadastraisModel.linguagens
                                            .remove(linguagem);
                                      });
                                    }
                                  }),
                            )
                            .toList()),
                    const TextLabel(texto: "Tempo Experiencia"),
                    DropdownButton(
                        value: dadosCadastraisModel.tempoExp,
                        isExpanded: true,
                        items: returnItens(50),
                        onChanged: (value) {
                          setState(() {
                            dadosCadastraisModel.tempoExp =
                                int.parse(value.toString());
                          });
                        }),
                    TextLabel(
                        texto:
                            "Pretenção Salarial. R\$ ${dadosCadastraisModel.salario?.round().toString()}"),
                    Slider(
                        min: 0,
                        max: 10000,
                        value: dadosCadastraisModel.salario ?? 0,
                        onChanged: (double value) {
                          setState(() {
                            dadosCadastraisModel.salario = value;
                          });
                        }),
                    TextButton(
                        onPressed: () async {
                          setState(() {
                            salvando = false;
                          });
                          if (nomeController.text.trim().length < 3) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("O nome deve ser preenchido")));
                            return;
                          } else if (dadosCadastraisModel.dataNascimento ==
                              null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Data de  Nascimento Invalida")));
                            return;
                          } else if (dadosCadastraisModel.nivelExp == null ||
                              dadosCadastraisModel.nivelExp!.trim() == '') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Nivel deve ser selecionado")));
                            return;
                          } else if (dadosCadastraisModel.linguagens.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Deve ser selecionado ao meno uma linguagem")));
                            return;
                          } else if (dadosCadastraisModel.tempoExp == null ||
                              dadosCadastraisModel.tempoExp == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Deve ao menos ter um ano de Experiencia em uma das linguagens")));
                            return;
                          } else if (dadosCadastraisModel.salario == null ||
                              dadosCadastraisModel.salario == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "A pretencao salarial deve ser maior que 0")));
                            return;
                          }

                          dadosCadastraisModel.nome = nomeController.text;
                          dadosCadastraisRepositories
                              .salvar(dadosCadastraisModel);
                          setState(() {
                            salvando = true;
                          });

                          Future.delayed(const Duration(seconds: 3), () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Dados salvo com sucesso!!")));
                            Navigator.pop(context);
                          });
                        },
                        child: const Text("Salvar"))
                  ],
                ),
        ));
  }
}
