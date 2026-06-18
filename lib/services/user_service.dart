import 'package:dio/dio.dart';
import '../models/user.dart';
import 'api_service.dart';

class UserService {

  Future<User> getMyUser() async {
    try {
      final response = await ApiService.dio.get(
        '/user/me',
      );

      print("USER RESPONSE:");
      print(response.data);

      final data = response.data['data'];

      return User.fromJson(data);

    } on DioException catch (e) {

      print("STATUS: ${e.response?.statusCode}");
      print("DATA: ${e.response?.data}");
      
      rethrow;
    }
  }
  
}