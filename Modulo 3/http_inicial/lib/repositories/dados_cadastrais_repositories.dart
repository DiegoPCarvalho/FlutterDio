import 'package:hive/hive.dart';
import 'package:trilhapp/model/dados_cadastrais_model.dart';

class DadosCadastraisRepositories {
  static late Box _box;

  DadosCadastraisRepositories._criar();

  static Future<DadosCadastraisRepositories> carregar() async {
    if (Hive.isBoxOpen('dadosCadastrais')) {
      _box = Hive.box('dadosCadastrais');
    } else {
      _box = await Hive.openBox('dadosCadastrais');
    }
    return DadosCadastraisRepositories._criar();
  }

  salvar(DadosCadastraisModel dadosCadastraisModel) {
    _box.put('dadosCadastrais', dadosCadastraisModel);
  }

  DadosCadastraisModel obterDados() {
    var dadosCadastraismodel = _box.get('dadosCadastrais');
    if (dadosCadastraismodel == null) {
      return DadosCadastraisModel.vazio();
    } else {
      return dadosCadastraismodel;
    }
  }
}
