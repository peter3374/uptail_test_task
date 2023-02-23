import 'package:dio/dio.dart';

class NetworkSource {
  static final NetworkSource _instance = NetworkSource._internal();

  factory NetworkSource() {
    return _instance;
  }
  NetworkSource._internal();

  static final _dio = Dio();

  Future<Response<dynamic>> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

}
