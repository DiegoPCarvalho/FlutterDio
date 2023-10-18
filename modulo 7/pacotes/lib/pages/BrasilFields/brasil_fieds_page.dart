import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrasilFieldsPage extends StatefulWidget {
  const BrasilFieldsPage({super.key});

  @override
  State<BrasilFieldsPage> createState() => _BrasilFieldsPageState();
}

class _BrasilFieldsPageState extends State<BrasilFieldsPage> {
  var cepControl = TextEditingController(text: "");
  var cpfControl = TextEditingController(text: "");
  var centControl = TextEditingController(text: "");
  var estilo = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  var espaco = const SizedBox(height: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Cep", style: estilo),
            TextFormField(
              controller: cepControl,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
            ),
            espaco,
            Text("CPF", style: estilo),
            TextFormField(
              controller: cpfControl,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
            ),
            espaco,
            Text("Centavos", style: estilo),
            TextFormField(
              controller: centControl,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CentavosInputFormatter(moeda: true),
              ],
            ),
            espaco,
            Center(
                child: TextButton(
                    onPressed: () {
                      debugPrint(
                          CPFValidator.isValid(cpfControl.text).toString());
                      debugPrint(CPFValidator.generate().toString());
                    },
                    child: const Text("Continuar"))),
          ]),
        ),
      ),
    );
  }
}
