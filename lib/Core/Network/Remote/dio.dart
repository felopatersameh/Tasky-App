import 'package:dio/dio.dart';
import 'package:tasky/Core/Network/Remote/endpoints.dart';

// baseUrl: https://newsapi.org/
// v2/top-headlines
// ?
// country=eg&category=business&apiKey=70c84b24f0b3416da405361d79906233

//https://todo.iraqsapp.com
class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppEndPoint.baseUrl, // Update with your actual base URL
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add headers or perform any request-related tasks
          // print('Request[${options.method}] => PATH: ${options.path}');
          return handler.next(options); // Continue the request
        },
        onResponse: (response, handler) {
          // Handle responses
          // print('Response[${response.statusCode}] => DATA: ${response.data}');
          return handler.next(response); // Continue with the response
        },
        onError: (DioException e, handler) {
          // Handle errors
          // print('Error[${e.response?.statusCode}] => MESSAGE: ${e.message}');
          return handler.next(e); // Continue with the error
        },
      ),
    );
    // dio.interceptors.add(LogInterceptor(
    //   request: true,
    //   requestHeader: true,
    //   requestBody: true,
    //   responseHeader: true,
    //   responseBody: true,
    //   error: true,
    // ));
  }

  static Future<Response> getData({
    required String path,
    String? token,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    options ??= Options();
    if (token != null) {
      options.headers = {
        'Authorization': 'Bearer $token',
      };
    }
    return await dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  static Future<Response> postData({
    required String path,
    required dynamic data,
    String? token,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    options ??= Options(contentType: 'application/json');
    if (token != null) {
      options.headers = {
        'Authorization': 'Bearer $token',
      };
    }
    return await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  static Future<Response> putData({
    required String path,
    required Map<String, dynamic> data,
    String? token,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    options ??= Options();
    if (token != null) {
      options.headers = {
        'Authorization': 'Bearer $token',
      };
    }
    return await dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  static Future<Response> deleteData({
    required String path,
    String? token,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    options ??= Options();
    if (token != null) {
      options.headers = {
        'Authorization': 'Bearer $token',
      };
    }
    return await dio.delete(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
