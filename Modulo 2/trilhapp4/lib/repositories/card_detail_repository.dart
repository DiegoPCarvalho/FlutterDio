import 'package:trilhapp/model/card_detail.dart';

class CardDetailRepository {
  Future<CardDetail> get() async {
    await Future.delayed(const Duration(seconds: 3));
    return CardDetail(
        1,
        "SE Palmeiras",
        "https://www.palmeiras.com.br/wp-content/themes/foursys-palmeiras/assets/images/logo-palmeiras.png",
        "Sociedade Esportiva Palmeiras é um clube poliesportivo brasileiro da cidade de São Paulo, capital do estado homônimo. Foi fundado em 26 de agosto de 1914 e suas cores, presentes no escudo e bandeira oficial, são o verde e branco");
  }
}
