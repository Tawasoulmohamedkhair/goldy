import 'package:dio/dio.dart';

class ApiFailure {
  final String message;

  const ApiFailure(this.message);

  factory ApiFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ApiFailure("Connection timeout with the server.");
      case DioExceptionType.sendTimeout:
        return const ApiFailure("Send timeout in association with server.");
      case DioExceptionType.receiveTimeout:
        return const ApiFailure("Receive timeout in connection with server.");
      case DioExceptionType.badCertificate:
        return const ApiFailure("Bad certificate with the server.");
      case DioExceptionType.badResponse:
        return ApiFailure._fromResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
      case DioExceptionType.cancel:
        return const ApiFailure("Request to the server was cancelled.");
      case DioExceptionType.connectionError:
        return const ApiFailure("No internet connection.");
      case DioExceptionType.unknown:
        return const ApiFailure(
          "An unexpected error occurred, please try again.",
        );
    }
  }

  factory ApiFailure._fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ApiFailure(response?['message'] ?? "Unauthorized request.");
    } else if (statusCode == 404) {
      return const ApiFailure("Endpoint not found. Please try again later.");
    } else if (statusCode == 429) {
      return const ApiFailure("Too many requests. Please try again later.");
    } else if (statusCode == 500) {
      return const ApiFailure("Internal server error, please try again later.");
    } else {
      return const ApiFailure("Opps, something went wrong. Please try again.");
    }
  }
}
