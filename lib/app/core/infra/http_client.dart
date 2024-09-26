import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioConfig {
  late Dio _dio;

  DioConfig() {
    _dio = Dio(BaseOptions(
      baseUrl: "http://localhost:7777",
      // connectTimeout: const Duration(milliseconds: 5000),
      // receiveTimeout: const Duration(milliseconds: 3000),
      headers: {
        'Content-Type': 'application/json',
      },
    ));

    // Attach interceptor for adding Bearer Token
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString('token');

        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException error, handler) {
        // Handle error
        return handler.next(error);
      },
    ));
  }

  Dio get dio => _dio;
}
