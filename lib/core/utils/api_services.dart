import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;
  final String baseUrl = 'https://www.googleapis.com/books/v1/volumes';
  final String key = '&key=AIzaSyCUf1xlWE6TnyTRKJZQ64x-HTKK1nbKkZk';

  ApiServices(this._dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint$key');
    return response.data;
  }
}
