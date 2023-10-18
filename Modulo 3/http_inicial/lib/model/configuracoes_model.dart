// ignore_for_file: unnecessary_getters_setters

class ConfiguracoesModel {
  String _nomeUsuario = "";
  double _altura = 0;
  bool _notificacoes = false;
  bool _temaEscuro = false;

  ConfiguracoesModel.vazio() {
    _nomeUsuario = "";
    _altura = 0;
    _notificacoes = false;
    _temaEscuro = false;
  }

  ConfiguracoesModel(
      this._nomeUsuario, this._altura, this._notificacoes, this._temaEscuro);

  //nome usuario
  String get nomeUsuario => _nomeUsuario;
  set nomeUsuario(String nomeUsuario) => _nomeUsuario = nomeUsuario;

  //nome altura
  double get altura => _altura;
  set altura(double altura) => _altura = altura;

  //nome notificacoes
  bool get notificacoes => _notificacoes;
  set notificacoes(bool notificacoes) => _notificacoes = notificacoes;

  //nome temaEscuro
  bool get temaEscuro => _temaEscuro;
  set temaEscuro(bool temaEscuro) => _temaEscuro = temaEscuro;
}
