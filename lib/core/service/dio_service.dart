import 'package:dio/dio.dart';

class DioService {
  static Dio baseDio() {
    Dio dio = Dio(
      BaseOptions(baseUrl: 'https://rest-api.technicmate.com/v1'),
    );
    return dio;
  }
}
