//write api service with dio
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://reqres.in/api';
  Future<Response> post(String path,
      {required Map<String, dynamic> data}) async {
    return _dio.post('$_baseUrl/$path', data: data);
  }

  Future<Response> get(String path) async {
    return _dio.get('$_baseUrl/$path');
  }
}
