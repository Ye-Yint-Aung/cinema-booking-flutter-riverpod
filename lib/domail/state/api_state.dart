import 'package:riverpod_demo/domail/state/data_type.dart';


abstract class ApiState extends DataType {}

class InitialState extends ApiState {}

class LoadingState extends ApiState {}

class SuccessState extends ApiState {
  final dynamic data;

  SuccessState(this.data);
}

/// This state under 200 Status code with status false value.
class OtherState extends ApiState {
  final dynamic other;

  OtherState(this.other);
}

class ErrorState extends ApiState {
  final dynamic error;
  final ErrorType errorType;

  ErrorState(this.error, this.errorType);
}

enum ErrorType { server, forbidden, badState, notFound, unknown }

ErrorType codeToType(int? statusCode) {
  return switch (statusCode) {
    404 => ErrorType.notFound,
    500 => ErrorType.server,
    400 => ErrorType.badState,
    503 => ErrorType.forbidden,
    _ => ErrorType.unknown
  };
}
