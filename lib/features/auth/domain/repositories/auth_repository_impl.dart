import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileshop/common/exceptions/exceptions.dart';
import 'package:mobileshop/common/extensions/future.dart';
import 'package:mobileshop/features/auth/data/data_source/auth_data_source.dart';
import 'package:mobileshop/features/auth/data/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(authDataSource: ref.read(authDataSourceProvider));
});

class AuthRepositoryImpl implements AuthRepository {
  AuthDataSource authDataSource;
  AuthRepositoryImpl({required this.authDataSource});
  @override
  Future<Either<Failure, String>> login(String email, String password) {
    return authDataSource.login(email, password).toEither();
  }

  @override
  Future<Either<Failure, void>> logout() {
    return authDataSource.logout().toEither();
  }

  @override
  Future<Either<Failure, String>> signUp(String email, String password) {
    return authDataSource.signUp(email, password).toEither();
  }
}
