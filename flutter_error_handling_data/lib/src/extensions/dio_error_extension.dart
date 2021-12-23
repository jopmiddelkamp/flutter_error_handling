import 'dart:io';

import 'package:dio/dio.dart';

import '../../flutter_error_handling_data.dart';

extension DioErrorX on DioError {
  bool get isUnreachable {
    return type.isTimeout ||
        (type.isResponse &&
            (response!.statusCode == HttpStatus.serviceUnavailable ||
                response!.statusCode == HttpStatus.badGateway ||
                response!.statusCode == HttpStatus.gatewayTimeout));
  }

  bool get isNotFound =>
      type.isResponse && response!.statusCode == HttpStatus.notFound;
  bool get isUnauthorized =>
      type.isResponse && response!.statusCode == HttpStatus.unauthorized;
  bool get isForbidden =>
      type.isResponse && response!.statusCode == HttpStatus.forbidden;
  bool get isUnexpectedFailure =>
      !isUnreachable && !isNotFound && !isUnauthorized;
}
