import 'package:dio/dio.dart';
import 'package:unoapp/core/utils/failures.dart';

Failure mapDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionError:
      return NetworkFailure('No internet connection');
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return TimeoutFailure('Request timed out');
    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;
      return ServerFailure(_messageFromStatusCode(statusCode));
    case DioExceptionType.cancel:
      return ServerFailure('Request was cancelled');
    case DioExceptionType.unknown:
    default:
      return ServerFailure('An unexpected error occurred');
  }
}

String _messageFromStatusCode(int? statusCode) {
  return switch (statusCode) {
    400 => 'Bad request',
    401 => 'Unauthorised',
    403 => 'Access forbidden',
    404 => 'Resource not found',
    500 => 'Internal server error',
    503 => 'Service unavailable',
    _ => 'Server error (${statusCode ?? 'unknown'})',
  };
}
