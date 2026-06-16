import 'package:dio/dio.dart';
import 'api_service.dart';

class PharmacyMedicineService {
  Future<Response> getPharmacyMedicines({
    int limit = 10,
    int offset = 0,
  }) async {
    try {
      final response = await ApiService.dio.get(
        '/admin/pharmacymedicines',
        queryParameters: {'limit': limit, 'offset': offset},

        options: Options(responseType: ResponseType.plain),
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
