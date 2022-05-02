import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class NetworkService {
  static final NetworkService _instance = NetworkService._();

  static NetworkService get instance => _instance;

  late final Dio dio;

  NetworkService._() {
    dio = Dio();

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
}