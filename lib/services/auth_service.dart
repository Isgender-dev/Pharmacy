import 'package:dio/dio.dart';
import 'package:pharmacy/core/token_storage.dart';
import 'api_service.dart';

class AuthService {
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    final response = await ApiService.dio.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );

    print("LOGIN RESPONSE: ${response.data}");

    final token = response.data['data']?['token'];

    await TokenStorage.saveToken(token);
    ApiService.setToken(token);

    return response;
  }
}
