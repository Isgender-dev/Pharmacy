import 'package:dio/dio.dart';
import 'api_service.dart';

class PharmacyService {
  Future<Response> getPharmacies({int limit = 20,int offset = 0}) async {
    try {
      final response = await ApiService.dio.get(
        '/admin/pharmacies',
        queryParameters: {'limit': limit, 'offset': offset},

      );

      print('RAW RESPONSE:');
      print(response.data);

      return response;
    } on DioException catch (e) {

      print('STATUS: ${e.response?.statusCode}');
      print("HEADERS: ${e.response?.headers}");
      print('DATA: ${e.response?.data}');
      print('MESSAGE: ${e.message}');

      rethrow;
    }
  }
}
