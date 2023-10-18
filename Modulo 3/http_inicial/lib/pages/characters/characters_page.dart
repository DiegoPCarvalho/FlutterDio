import 'package:flutter/material.dart';
import 'package:trilhapp/model/caracters_model.dart';
import 'package:trilhapp/repositories/marvel/marvel_repository.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  ScrollController _scrollController = ScrollController();
  late MarvelRepository marvelRepository;
  var characters = CharactersModel();
  int offset = 0;
  var carregando = false;

  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(() {
      var posicaoParaPaginar = _scrollController.position.maxScrollExtent * 0.7;
      if (_scrollController.position.pixels > posicaoParaPaginar) {
        carregarDados();
      }
    });
    marvelRepository = MarvelRepository();
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    if (carregando) return;
    if (characters.data == null || characters.data!.results == null) {
      characters = await marvelRepository.getCaracters(offset);
    } else {
      carregando = true;
      setState(() {});
      offset = offset + characters.data!.count!;
      var tempList = await marvelRepository.getCaracters(offset);
      characters.data!.results!.addAll(tempList.data!.results!);
      carregando = false;
    }
    setState(() {});
  }

  int retornaQuantidadeTotal() {
    try {
      return characters.data!.total!;
    } catch (e) {
      return 0;
    }
  }

  int retornaQuantidadeAtual() {
    try {
      return offset + characters.data!.count!;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Herois: ${retornaQuantidadeAtual()}/${retornaQuantidadeTotal()}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
              backgroundColor: Colors.orange,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      controller: _scrollController,
                      itemCount: (characters.data == null ||
                              characters.data!.results == null)
                          ? 0
                          : characters.data!.results!.length,
                      itemBuilder: (_, int index) {
                        var character = characters.data!.results![index];
                        return Card(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              "${character.thumbnail!.path!}.${character.thumbnail!.extension!}",
                              width: 75,
                              height: 75,
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      character.name!,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      character.description!,
                                      style: const TextStyle(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ));
                      }),
                ),
                !carregando
                    ? ElevatedButton(
                        onPressed: () {
                          carregarDados();
                        },
                        child: const Text("Carregar mais Itens"))
                    : const CircularProgressIndicator()
              ],
            )));
  }
}
