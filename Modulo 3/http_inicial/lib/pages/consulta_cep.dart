import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trilhapp/model/http/via_cep_http_model.dart';
import 'package:trilhapp/repositories/via_cep_http_repository.dart';

class ConsultaCep extends StatefulWidget {
  const ConsultaCep({super.key});

  @override
  State<ConsultaCep> createState() => _ConsultaCepState();
}

class _ConsultaCepState extends State<ConsultaCep> {
  var cepController = TextEditingController(text: "");
  String endereco = "";
  String cidade = "";
  String estado = "";
  bool loading = false;
  var viacepmodel = ViaCEPModel();
  var viaCepRepository = ViaCepRepository();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const Text(
              "Consuta de CEP",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              onChanged: (String value) async {
                // var cep = value.trim().replaceAll("-", "");
                var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                if (cep.length == 8) {
                  setState(() {
                    loading = true;
                  });
                  viacepmodel = await viaCepRepository.consultarCep(cep);
                }
                setState(() {
                  loading = false;
                });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              viacepmodel.logradouro ?? "",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              " ${viacepmodel.localidade ?? ""} - ${viacepmodel.uf ?? ""}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            if (loading) const CircularProgressIndicator()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var response = await http.get(Uri.parse("https://www.google.com"));
          debugPrint(response.body);
          debugPrint(response.statusCode.toString());
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}
