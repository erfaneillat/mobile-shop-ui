import 'package:dartz/dartz.dart';
import 'package:mobileshop/common/exceptions/exceptions.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> login(String email, String password);
  Future<Either<Failure, String>> signUp(String email, String password);
  Future<Either<Failure, void>> logout();
}
