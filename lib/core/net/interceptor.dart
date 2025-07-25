import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../export_files.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[AppConstants.headerAccept] = 'application/json';
    if (options.headers.containsKey('Authorization')) {
      final authHeader = options.headers['Authorization'] as String;
      if (!authHeader.startsWith('Bearer ')) {
        options.headers['Authorization'] = 'Bearer $authHeader';
      }
    }
    return super.onRequest(options, handler);
  }
}

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra['startTime'] = DateTime.now().millisecondsSinceEpoch;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final int startTime = response.requestOptions.extra['startTime'];
    final int endTime = DateTime.now().millisecondsSinceEpoch;
    final int requestDuration = endTime - startTime;

    if (kDebugMode) {
      print(
          'Request to ${response.requestOptions.path} took: ${requestDuration}ms');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final int startTime = err.requestOptions.extra['startTime'];
    final int endTime = DateTime.now().millisecondsSinceEpoch;
    final int requestDuration = endTime - startTime;

    if (kDebugMode) {
      print(
          'Request to ${err.requestOptions.path} took: ${requestDuration}ms (with error)');
    }
    super.onError(err, handler);
  }
}
