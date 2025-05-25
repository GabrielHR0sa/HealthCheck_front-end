import 'package:dio/dio.dart';

class DioClient {
  static late final Dio dio;

  static void init(String ip) {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://$ip/api/',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  static void updateIp(String newIp) {
    dio.options.baseUrl = 'http://$newIp/api/';
  }
}
