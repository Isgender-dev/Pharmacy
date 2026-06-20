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

    final token = response.data['data']['token'];

    await TokenStorage.saveToken(token);
    ApiService.setToken(token);

    return response;
  }

  Future<void> logout() async {
    try {
      final response = await ApiService.dio.post('/auth/logout');

      print("LOGOUT RESPONSE: ${response.data}");
    } on DioException catch (e) {
      print("LOGOUT ERROR: ${e.response?.data}");
      print("STATUS: ${e.response?.statusCode}");
    } finally {
      await TokenStorage.clear();
      ApiService.setToken(null);
    }
  }

  Future<Response> registration({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await ApiService.dio.post(
      '/auth/register',
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    print("REGISTRATION RESPONSE: ${response.data}");

    final token = response.data['data']?['token'];

    await TokenStorage.saveToken(token);
    ApiService.setToken(token);

    return response;
  }
}
