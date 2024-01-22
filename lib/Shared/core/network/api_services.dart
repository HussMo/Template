import 'package:dio/dio.dart';
import 'package:theme_app/Shared/constant/app_value.dart';

class ApiService {
  final Dio _dio;

  final baseUrl = AppValues.baseUrl;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required Map<String, dynamic> body}) async {
    var response = await _dio.post('$baseUrl$endPoint', data: body);
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required String endPoint, required Map<String, dynamic> body}) async {
    var response = await _dio.put('$baseUrl$endPoint', data: body);
    return response.data;
  }

  Future<Map<String, dynamic>> delete({required String endPoint}) async {
    var response = await _dio.delete('$baseUrl$endPoint');
    return response.data;
  }
}