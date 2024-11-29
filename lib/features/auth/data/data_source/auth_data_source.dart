import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileshop/common/extensions/response.dart';
import 'package:mobileshop/services/api_service.dart';

final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSourceImpl(apiService: ref.read(apiServiceProvider));
});

abstract class AuthDataSource {
  Future<String> login(String email, String password);
  Future<String> signUp(String email, String password);
  Future<void> logout();
}

class AuthDataSourceImpl implements AuthDataSource {
  ApiService apiService;
  AuthDataSourceImpl({required this.apiService});
  @override
  Future<String> login(String email, String password) async {
    final data = await apiService.post('login',
        data: {'email': email, 'password': password}).handleResponse();
    return data['token'];
  }

  @override
  Future<String> signUp(String email, String password) async {
    final data = await apiService.post('register',
        data: {'email': email, 'password': password}).handleResponse();
    return data['token'];
  }

  @override
  Future<void> logout() async {}
}
