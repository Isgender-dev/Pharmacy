import 'package:dio/dio.dart';
import 'api_service.dart';

class AuthService {
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    return await ApiService.dio.post(
      '/api/login',
      queryParameters: {
        'email': email,
        'password': password,
      },
    );
  }
}