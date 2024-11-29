import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileshop/common/platform/async_operation.dart';
import 'package:mobileshop/features/auth/data/repositories/auth_repository.dart';
import 'package:mobileshop/features/auth/domain/repositories/auth_repository_impl.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, AsyncOperation<String>>((ref) {
  return AuthNotifier(repository: ref.read(authRepositoryProvider));
});

class AuthNotifier extends StateNotifier<AsyncOperation<String>> {
  AuthNotifier({required this.repository}) : super(AsyncOperation.initial());

  final AuthRepository repository;
  Future<void> login(String email, String password) async {
    state = AsyncOperation.loading();
    final result = await repository.login(email, password);
    state = result.fold(
      (error) => AsyncOperation.error(error),
      (t) => AsyncOperation<String>(t),
    );
  }

  Future<void> signUp(String email, String password) async {
    state = AsyncOperation.loading();
    final result = await repository.signUp(email, password);
    state = result.fold(
      (error) => AsyncOperation.error(error),
      (t) => AsyncOperation<String>(t),
    );
  }
}
