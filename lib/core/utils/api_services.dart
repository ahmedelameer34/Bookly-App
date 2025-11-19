import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiServices {
  final Dio _dio;
  final String baseUrl = 'https://www.googleapis.com/books/v1/volumes';
  final String key = dotenv.env['GOOGLE_API_KEY'] ?? '';

  ApiServices(this._dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint$key');
    return response.data;
  }
}
