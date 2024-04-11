import 'dart:convert';
import 'package:http/http.dart' as http;

class APIUtils {
  late String url;
  late String method;
  late Map<String, String>? headers;
  late Map<String, dynamic>? data;

  APIUtils({required this.url, required this.method , this.headers, this.data});

  Future<http.Response?> call() async {
    try {
      var response;

      switch(method) {
        case 'GET':
          response = await http.get(Uri.parse(url), headers: headers);
          break;

        case 'POST':
          response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(data));
          break;

        case 'PUT':
          response = await http.put(Uri.parse(url), headers: headers, body: jsonEncode(data));
          break;

        case 'DELETE':
          response = await http.delete(Uri.parse(url), headers: headers);
          break;

        default:
          print('Error: Método no permitido');
          break;
      }

      return response;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}