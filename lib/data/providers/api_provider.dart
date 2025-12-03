import 'package:dio/dio.dart';
import '../../core/constants/app_constants.dart';

class ApiProvider {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  Future<dynamic> get(String path) async {
    try {
      final response = await _dio.get(path);
      return response.data; // Returns decoded JSON data
    } on DioException catch (e) {
      // Handle Dio errors (no internet, 404, 500 etc.)
      throw Exception('API Error: ${e.message}');
    }
  }

// Add post, put, delete methods as needed...
}