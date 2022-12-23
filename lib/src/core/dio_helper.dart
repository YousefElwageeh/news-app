import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getdata({
    required String url,
    required dynamic quary,
  }) async {
    return await dio.get(url, queryParameters: quary);
  }
}
