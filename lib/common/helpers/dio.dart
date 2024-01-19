import 'dart:io';
import 'package:dio/io.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioBuilder extends DioMixin implements Dio {
  DioBuilder([BaseOptions? options]) {
    this.options = options ?? BaseOptions();
    _fixBadCertificate();
  }

  void _fixBadCertificate() {
    if (kIsWeb) return;

    final client = HttpClient()..idleTimeout = const Duration(seconds: 3);

    client.badCertificateCallback = (
      X509Certificate cert,
      String host,
      int port,
    ) {
      return true;
    };

    httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () => client,
    );
  }
}
