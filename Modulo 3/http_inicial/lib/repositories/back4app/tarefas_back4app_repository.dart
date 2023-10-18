import 'package:trilhapp/model/tarefas_back4app_model.dart';
import 'package:trilhapp/repositories/back4app/back4app_custom_dio.dart';

class TarefasBack4AppRepository {
  final _customDio = Back4AppCustomDio();

  TarefasBack4AppRepository();

  Future<TarefasBack4AppModel> obterTarefas(bool naoConcluidas) async {
    var url = "/Tarefas";
    if (naoConcluidas) {
      url = "$url?where={\"concluido\":false}";
    }
    var result = await _customDio.dio.get(url);
    return TarefasBack4AppModel.fromJson(result.data);
  }

  Future<void> criar(Tarefa tarefa) async {
    try {
      await _customDio.dio.post("/Tarefas", data: tarefa.toJsonEndpoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> atualizar(Tarefa tarefa) async {
    try {
      await _customDio.dio
          .put("/Tarefas/${tarefa.objectId}", data: tarefa.toJsonEndpoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> remover(String objectId) async {
    try {
      await _customDio.dio.delete("/Tarefas/$objectId");
    } catch (e) {
      rethrow;
    }
  }
}
