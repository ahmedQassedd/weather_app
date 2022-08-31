import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.openweathermap.org/data/2.5/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String endPoint,
    required String country ,
  }) async {
    return await dio!.get(endPoint, queryParameters: {'q':country, 'appid':'e6324cd99bd6387f7b0c69bc4ac65a61' });
  }
}
