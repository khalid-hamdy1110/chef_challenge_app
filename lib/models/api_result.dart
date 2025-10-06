enum ApiErrorType { network, server, timeout, unknown }

class ApiError {
  final String message;
  final ApiErrorType type;
  final int? statusCode;

  ApiError({
    required this.message,
    this.type = ApiErrorType.unknown,
    this.statusCode,
  });

  @override
  String toString() => message;
}

class ApiResult<T> {
  final T? data;
  final ApiError? error;

  ApiResult.success(this.data) : error = null;
  ApiResult.failure(this.error) : data = null;

  bool get isSuccess => error == null;
  bool get isFailure => error != null;
}
