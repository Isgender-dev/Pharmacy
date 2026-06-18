import 'package:dio/dio.dart';
// import 'package:pharmacy/core/token_storage.dart';

class ApiService {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.0.191:8080/api',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static String? _token;
  static bool _initialized = false;

  static void setToken(String? token) {
    _token = token;
  }

  static void init() {
    if (_initialized) return;
    _initialized = true;

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {

          print("REQUEST URL: ${options.uri}");
          print("TOKEN IN MEMORY: $_token");

          if (_token != null && _token!.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $_token';
          }

          print("HEADERS: ${options.headers}");

          handler.next(options);
        },
        onError: (e, handler) {

          print('DIO ERROR: ${e.error}');
          
          handler.next(e);
        },
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }
}
