import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 1. Add Auth Token if available
    // options.headers['Authorization'] = 'Bearer YOUR_TOKEN';
    // 2. Add headers like Content-Type or Language
    options.headers['Content-Type'] = 'application/json';

    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle global errors here
    if (err.response?.statusCode == 401) {
      // e.g., Logout user or navigate to login
      debugPrint('Unauthorized: Redirecting to login');
    }
    debugPrint('ERROR[${err.response?.statusCode}] => MESSAGE: ${err.message}');
    super.onError(err, handler);
  }
}
