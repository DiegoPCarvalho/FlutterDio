import 'package:hive/hive.dart';

part 'dados_cadastrais_model.g.dart';

@HiveType(typeId: 0)
class DadosCadastraisModel extends HiveObject {
  @HiveField(0)
  String? nome;

  @HiveField(1)
  DateTime? dataNascimento;

  @HiveField(2)
  String? nivelExp;

  @HiveField(3)
  List<String> linguagens = [];

  @HiveField(4)
  int? tempoExp;

  @HiveField(5)
  double? salario;

  DadosCadastraisModel();

  DadosCadastraisModel.vazio() {
    nome = "";
    dataNascimento = null;
    nivelExp = "";
    linguagens = [];
    tempoExp = 0;
    salario = 0;
  }
}
