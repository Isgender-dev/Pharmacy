import 'package:dio/dio.dart';
import 'api_service.dart';

class CategoryService {
  Future<Response> getCategories(String token) async {
    return await ApiService.dio.get(
      '/admin/category',
      queryParameters: {'limit': 10, 'offset': 0, 'token': token},
    );
  }
}
