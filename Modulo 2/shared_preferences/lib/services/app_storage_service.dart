import 'package:shared_preferences/shared_preferences.dart';

enum Storage_Keys {
  chave_nome,
  chave_data_nasc,
  chave_nivel_exp,
  chave_lingaugens,
  chave_tempo_exp,
  chave_salario,
  chave_bool
}

class AppStorageService {
  late SharedPreferences storage;

  Future<void> setChaveNome(String nome) async {
    await _setString(Storage_Keys.chave_nome.toString(), nome);
  }

  Future<String> getChaveNome() async {
    return await _getString(Storage_Keys.chave_nome.toString());
  }

  Future<void> setChaveData(DateTime data) async {
    await _setString(Storage_Keys.chave_data_nasc.toString(), data.toString());
  }

  Future<String> getChaveData() async {
    return await _getString(Storage_Keys.chave_data_nasc.toString());
  }

  Future<void> setChaveNivelExp(String nivelExp) async {
    await _setString(Storage_Keys.chave_nivel_exp.toString(), nivelExp);
  }

  Future<String> getChaveNivelExp() async {
    return await _getString(Storage_Keys.chave_nivel_exp.toString());
  }

  Future<void> setChavelinguagens(List<String> linguagens) async {
    await _setStringList(Storage_Keys.chave_lingaugens.toString(), linguagens);
  }

  Future<List<String>> getChavelinguagens() async {
    return await _getStringList(Storage_Keys.chave_lingaugens.toString());
  }

  Future<void> setChaveTempoExp(int tempoExp) async {
    await _setInt(Storage_Keys.chave_tempo_exp.toString(), tempoExp);
  }

  Future<int> getChaveTempoExp() async {
    return await _getInt(Storage_Keys.chave_tempo_exp.toString());
  }

  Future<void> setChaveSalario(double salario) async {
    await _setDouble(Storage_Keys.chave_salario.toString(), salario);
  }

  Future<double> getChaveSalario() async {
    return await _getDouble(Storage_Keys.chave_salario.toString());
  }

  Future<void> setChaveBool(bool tempo) async {
    await _setBool(Storage_Keys.chave_bool.toString(), tempo);
  }

  Future<bool> getChaveBool() async {
    return await _getBool(Storage_Keys.chave_bool.toString());
  }

  Future<void> _setString(String chave, String value) async {
    storage = await SharedPreferences.getInstance();
    storage.setString(chave, value);
  }

  Future<String> _getString(String chave) async {
    storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

  Future<void> _setStringList(String chave, List<String> values) async {
    storage = await SharedPreferences.getInstance();
    storage.setStringList(chave, values);
  }

  Future<List<String>> _getStringList(String chave) async {
    storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave) ?? [];
  }

  Future<void> _setInt(String chave, int value) async {
    storage = await SharedPreferences.getInstance();
    storage.setInt(chave, value);
  }

  Future<int> _getInt(String chave) async {
    storage = await SharedPreferences.getInstance();
    return storage.getInt(chave) ?? 0;
  }

  Future<void> _setDouble(String chave, double value) async {
    storage = await SharedPreferences.getInstance();
    storage.setDouble(chave, value);
  }

  Future<double> _getDouble(String chave) async {
    storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }

  Future<void> _setBool(String chave, bool value) async {
    storage = await SharedPreferences.getInstance();
    storage.setBool(chave, value);
  }

  Future<bool> _getBool(String chave) async {
    storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }
}
