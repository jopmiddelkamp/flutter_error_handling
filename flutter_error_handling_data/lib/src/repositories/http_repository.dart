import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_error_handling_core/flutter_error_handling_core.dart';

import '../../flutter_error_handling_data.dart';

typedef RequestFunction = Future<Response> Function();

class HttpRepository extends RepositoryBase {
  HttpRepository({
    required this.baseUrl,
  }) : _dio = Dio();

  final Dio _dio;
  final String baseUrl;

  String _getApiUrl(
    String resource,
  ) {
    return baseUrl + (resource.startsWith('/') ? resource : '/$resource');
  }

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final endpoint = _getApiUrl(path);
    try {
      final result = await _dio.get<T>(
        endpoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return result.data!;
    } on DioError catch (error) {
      throw _resolveException(
        error,
        endpoint: endpoint,
      );
    }
  }

  Future<T?> getNullable<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final endpoint = _getApiUrl(path);
    try {
      final result = await _dio.get<T>(
        endpoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return result.data;
    } on DioError catch (error) {
      throw _resolveException(
        error,
        endpoint: endpoint,
      );
    } on Exception catch (error) {
      // Log details also to crashlytics
      debugPrint(
        '### Unexpected exception: ${error.toString()}',
      );
      throw Failure.unexpected(
        innerException: error,
      );
    }
  }

  Exception _resolveException(
    DioError error, {
    required String endpoint,
  }) {
    if (error.isUnreachable) {
      // Log details also to crashlytics
      debugPrint(
        '### Server unreachable: ${error.message}',
      );
      return const Failure.unreachable();
    } else if (error.isUnauthorized) {
      // Log details also to crashlytics
      debugPrint(
        '### Unauthorized: ${error.message}',
      );
      return const Failure.unauthorized();
    } else if (error.isNotFound) {
      // Log details also to crashlytics
      debugPrint(
        '### Not found: ${error.message}',
      );
      return const Failure.notFound();
    } else if (error.error is SocketException) {
      // Log details also to crashlytics
      debugPrint(
        'SocketException : ${error.message}',
      );
      throw const Failure.noInternet();
    }
    // Log details also to crashlytics
    debugPrint(
      '### Unexpected exception: ${error.message}',
    );
    return Failure.unexpected(
      innerException: error,
    );
  }
}
