import 'package:flutter/material.dart';
import 'package:trilhapp/repositories/linguagens_repositeries.dart';
import 'package:trilhapp/repositories/nivel_repositories.dart';
import 'package:trilhapp/shared/widgets/text_label.dart';

class DadosCadastrais extends StatefulWidget {
  const DadosCadastrais({Key? key}) : super(key: key);

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  var nomeController = TextEditingController(text: "");
  var dataNacimentoController = TextEditingController(text: "");

  DateTime? dataNacimento;
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepositories();
  var niveis = [];
  var linguagens = [];
  var nivelSelecionado = "";
  var linguagensSelecionadas = [];
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;

  bool salvando = false;

  @override
  void initState() {
    niveis = (nivelRepository.retornaNiveis());
    linguagens = (linguagensRepository.retornaLinguagens());
    super.initState();
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
                            dataNacimento = data;
                          }
                        }),
                    const TextLabel(texto: "Nivel de Experiencia"),
                    Column(
                        children: niveis
                            .map(
                              (nivel) => RadioListTile(
                                  dense: true,
                                  title: Text(nivel.toString()),
                                  selected: nivelSelecionado == nivel,
                                  value: nivel.toString(),
                                  groupValue: nivelSelecionado,
                                  onChanged: (value) {
                                    // print(value);
                                    setState(() {
                                      nivelSelecionado = value.toString();
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
                                  value: linguagensSelecionadas
                                      .contains(linguagem),
                                  onChanged: (bool? value) {
                                    if (value!) {
                                      setState(() {
                                        linguagensSelecionadas.add(linguagem);
                                      });
                                    } else {
                                      setState(() {
                                        linguagensSelecionadas
                                            .remove(linguagem);
                                      });
                                    }
                                  }),
                            )
                            .toList()),
                    const TextLabel(texto: "Tempo Experiencia"),
                    DropdownButton(
                        value: tempoExperiencia,
                        isExpanded: true,
                        items: returnItens(50),
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            tempoExperiencia = int.parse(value.toString());
                          });
                        }),
                    TextLabel(
                        texto:
                            "Pretenção Salarial. R\$ ${salarioEscolhido.round().toString()}"),
                    Slider(
                        min: 0,
                        max: 10000,
                        value: salarioEscolhido,
                        onChanged: (double value) {
                          setState(() {
                            salarioEscolhido = value;
                          });
                        }),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            salvando = false;
                          });
                          if (nomeController.text.trim().length < 3) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("O nome deve ser preenchido")));
                            return;
                          } else if (dataNacimento == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Data de  Nascimento Invalida")));
                            return;
                          } else if (nivelSelecionado.trim() == '') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Nivel deve ser selecionado")));
                            return;
                          } else if (linguagensSelecionadas.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Deve ser selecionado ao meno uma linguagem")));
                            return;
                          } else if (tempoExperiencia == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Deve ao menos ter um ano de Experiencia em uma das linguagens")));
                            return;
                          } else if (salarioEscolhido == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "A pretencao salarial deve ser maior que 0")));
                            return;
                          }
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
