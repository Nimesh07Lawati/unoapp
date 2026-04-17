import 'package:dio/dio.dart';
import 'package:unoapp/core/network/api_end_points.dart';
import 'app_interceptor.dart';

// Your Dio provider/setup
Dio createDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiEndPoints.baseurl,
      connectTimeout: const Duration(
        seconds: 25,
      ), // 25 is minimum time i need for the api in most cases
      receiveTimeout: const Duration(seconds: 25),
    ),
  );

  // Add the interceptor here
  dio.interceptors.add(AppInterceptor());

  //logger interceptor to see pretty print in console
  dio.interceptors.add(LogInterceptor(responseBody: true));

  return dio;
}
