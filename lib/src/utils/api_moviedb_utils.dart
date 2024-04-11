import 'package:http/http.dart' as http;
import 'package:proyecto_mvc/src/utils/APIutils.dart';


class TMDbAPI {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = '1eaa2da538ee011defaf03a05766a1e4';

  Future<http.Response?> call(
    String apiUrl, 
    String method, 
    {Map<String, dynamic>? data}) async {
    try {
      var apiUtils = APIUtils(url: apiUrl, method: method, data: data);
      return await apiUtils.call();
    } catch (e) {
      print('Error al realizar la solicitud: $e');
      return null;
    }
  }

  Future<http.Response?> get(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      final String apiUrl = '$baseUrl/$endpoint?api_key=$apiKey${_buildQueryParams(queryParams)}';
      return await call(apiUrl, 'GET');
    } catch (e) {
      print('Error en la solicitud GET: $e');
      return null;
    }
  }

  Future<http.Response?> post(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final String apiUrl = '$baseUrl/$endpoint?api_key=$apiKey';
      return await call(apiUrl, 'POST', data: body);
    } catch (e) {
      print('Error en la solicitud POST: $e');
      return null;
    }
  }

  Future<http.Response?> put(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final String apiUrl = '$baseUrl/$endpoint?api_key=$apiKey';
      return await call(apiUrl, 'PUT', data: body);
    } catch (e) {
      print('Error en la solicitud PUT: $e');
      return null;
    }
  }

  Future<http.Response?> delete(String endpoint) async {
    try {
      final String apiUrl = '$baseUrl/$endpoint?api_key=$apiKey';
      return await call(apiUrl, 'DELETE');
    } catch (e) {
      print('Error en la solicitud DELETE: $e');
      return null;
    }
  }

  String _buildQueryParams(Map<String, dynamic>? queryParams) {
    if (queryParams == null || queryParams.isEmpty) {
      return '';
    }

    String params = '';
    queryParams.forEach((key, value) {
      params += '&$key=$value';
    });
    return params;
  }
}