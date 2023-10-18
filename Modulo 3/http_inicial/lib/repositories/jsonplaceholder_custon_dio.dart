import 'package:dio/dio.dart';

class JsonPlaceholderCustonDio {
  final _dio = Dio();

  JsonPlaceholderCustonDio() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
  }

  Dio get dio => _dio;
}
