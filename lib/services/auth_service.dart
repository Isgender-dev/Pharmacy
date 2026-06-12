import 'package:dio/dio.dart';
import 'package:pharmacy/core/token_storage.dart';
import 'api_service.dart';

class AuthService {
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    final response = await ApiService.dio.post(
      '/login',
      queryParameters: {
        'email': email,
        'password': password,
      },
    );

    print(response.data);

    TokenStorage.token = response.data['token'];

    return response;
  }
}