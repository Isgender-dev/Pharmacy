import 'package:dio/dio.dart';
import 'api_service.dart';

class CategoryService {
  Future<Response> getCategories({int limit = 10, int offset = 0}) async {
    try {
      return await ApiService.dio.get(
        '/admin/categories',
        queryParameters: {'limit': limit, 'offset': offset},

      );
      
    } on DioException catch (e) {
      
      print('STATUS: ${e.response?.statusCode}');
      print("HEADERS: ${e.response?.headers}");
      print('DATA: ${e.response?.data}');
      print('MESSAGE: ${e.message}');

      rethrow;
    }
  }
}
