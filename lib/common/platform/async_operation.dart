import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobileshop/common/exceptions/exceptions.dart';

part 'async_operation.freezed.dart';

@freezed
class AsyncOperation<T> with _$AsyncOperation {
  const factory AsyncOperation.initial() = Initial;

  const factory AsyncOperation(T value) = Data;

  const factory AsyncOperation.loading() = Loading;

  const factory AsyncOperation.error(Failure error) = Error;
}

extension ExtOnAsyncOperation<T> on AsyncOperation<T> {
  bool get isInitial => this is Initial;

  bool get isLoading => this is Loading;

  bool get isData => this is Data;

  bool get isError => this is Error;

  Data<T> get data => this as Data<T>;

  Data? get dataOrNull => isData ? data : null;

  String? get errorMessage => isError ? (this as Error).error.message : null;
}
