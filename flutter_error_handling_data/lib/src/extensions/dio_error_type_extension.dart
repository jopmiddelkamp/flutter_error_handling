import 'package:dio/dio.dart';

extension DioErrorTypeX on DioErrorType {
  bool get isTimeout =>
      this == DioErrorType.connectTimeout ||
      this == DioErrorType.sendTimeout ||
      this == DioErrorType.receiveTimeout;
  bool get isResponse => this == DioErrorType.response;
}
