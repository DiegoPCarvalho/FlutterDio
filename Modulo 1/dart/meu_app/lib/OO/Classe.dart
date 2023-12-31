class Pessoa {
  //_nome o underline serve como private
  String _nome = "";
  String _endereco = "";

  void setNome(String nome) {
    _nome = nome;
  }

  void setEndereco(String endereco) {
    _endereco = endereco;
  }

  String getNome() {
    return _nome;
  }

  String getEndereco() {
    return _endereco;
  }

  Pessoa(String nome, String endereco) {
    _nome = nome;
    _endereco = endereco;
  } // constructor

  @override
  String toString() {
    return {"Nome": _nome, "Endereco": _endereco}.toString();
  }
}
