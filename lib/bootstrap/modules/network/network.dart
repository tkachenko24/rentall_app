import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class Network with DioMixin implements Dio {
  Network(
    String path, {
    List<Interceptor> interceptors = const [],
    Duration? connectTimeout = const Duration(seconds: 30),
    Duration? sendTimeout = const Duration(seconds: 30),
    Duration? receiveTimeout = const Duration(seconds: 30),
    HttpClientAdapter? adapter,
  }) {
    options = BaseOptions(
      baseUrl: path,
      connectTimeout: connectTimeout,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
    );

    if (interceptors.isNotEmpty) {
      interceptors.addAll(interceptors);
    }

    httpClientAdapter = adapter ??
        IOHttpClientAdapter(
          createHttpClient: () {
            final client = HttpClient();
            client.badCertificateCallback =
                (X509Certificate cert, String host, int port) => true;
            return client;
          },
        );
  }

  static clone(Dio input) {
    Dio dio = Dio(input.options);
    dio.httpClientAdapter = input.httpClientAdapter;
    dio.interceptors.addAll(input.interceptors);
    return dio;
  }
}
