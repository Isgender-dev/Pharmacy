import 'package:dio/dio.dart';
import 'api_service.dart';

class PharmacyMedicineService {
  Future<Response> getPharmacyMedicines({
    int limit = 10,
    int offset = 0,
  }) async {
    try {
      return await ApiService.dio.get(
        '/admin/pharmacymedicines',
        queryParameters: {
          'limit': limit,
          'offset': offset,
        },
      );
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? e.message);
    }
  }
}