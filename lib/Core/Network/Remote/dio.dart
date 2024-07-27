import 'package:dio/dio.dart';
import 'package:tasky/Core/Network/Remote/endpoints.dart';

// baseUrl: https://newsapi.org/
// v2/top-headlines
// ?
// country=eg&category=business&apiKey=70c84b24f0b3416da405361d79906233

//https://todo.iraqsapp.com
class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: AppEndPoint.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postData({
    required String path,
    required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio?.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return dio!.post(path, data: data, queryParameters: query);
  }

  static Future<Response> getData({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio?.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return dio!.get(path, data: data, queryParameters: query);
  }
}
