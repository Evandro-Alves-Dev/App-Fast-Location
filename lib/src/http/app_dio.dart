import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

mixin AppDio {
  static Future<Dio> getConnection() async {
    Dio dio = Dio();

    final Map<String, String> headers = <String, String>{};

    dio.options = BaseOptions();
    dio.options.receiveTimeout = 30000;
    dio.options.sendTimeout = 15000;
    dio.options.headers = headers;

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        onRequest(options);
        handler.next(options);
      },
      onResponse: onResponse,
      onError: (error, handler) async {
        onError(dio, error, handler);
      },
    ));

    return dio;
  }

  static void onRequest(RequestOptions options) {
    options.headers["Accept"] = "application/json";
    options.headers["Content-Type"] = "application/json";
    options.headers["Connection"] = "keep-alive";
    options.headers["Accept-Encoding"] = "gzip, deflate, br";
    options.headers["Accept-Language"] = "pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7";
    options.headers["User-Agent"] =
        "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Mobile Safari/537.36";

    debugPrint('-----------| Request log |-----------');
    debugPrint('${options.uri}');
  }

  static void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    debugPrint('-----------| Response log |-----------');
    debugPrint(response.data.toString());
    handler.next(response);
  }

  static void onError(
      Dio dio, DioError error, ErrorInterceptorHandler handler) {
    debugPrint('-----------| Error log |-----------');
    debugPrint('${error.response}');
    handler.next(error);
  }
}
