import 'dart:convert';
import 'package:trilhapp/model/http/via_cep_http_model.dart';
import 'package:http/http.dart' as http;

class ViaCepRepository {
  Future<ViaCEPModel> consultarCep(String cep) async {
    var response =
        await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ViaCEPModel.fromJson(json);
    }
    return ViaCEPModel();
  }
}