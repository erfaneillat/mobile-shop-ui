import '../exceptions/exceptions.dart';

extension ErrorCodeExt on String {
  void toFailure() {
    switch (this) {
      case 'UNEXPECTED_ERROR':
        throw UnExceptedFailure();
      case 'user not found':
        throw UserNotFoundFailure();
      default:
        throw UnExceptedFailure();
    }
  }
}
