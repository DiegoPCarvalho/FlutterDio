import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:trilhapp/repositories/back4app/back4app_dio_interceptor.dart';

class Back4AppCustomDio {
  final _dio = Dio();

  Dio get dio => _dio;

  Back4AppCustomDio() {
    _dio.options.baseUrl = dotenv.get("BASEURL");
    _dio.interceptors.add(Back4AppDioIntercptor());
  }
}
