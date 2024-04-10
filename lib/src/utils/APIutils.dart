import 'dart:convert';
import 'package:http/http.dart' as http;

class APIUtils {
  late String url; 
  String method = 'GET';
  Map<String, String>? headers;
  Map<String, dynamic>? data;

  APIUtils(
    this.url, {
      this.method = 'GET', 
      this.headers, 
      this.data
      }
    );

  Future<Map<String, dynamic>?> call() async {
    try {
      var response;
      if (method == 'GET') {
        response = await http.get(Uri.parse(url), headers: headers);
      } else if (method == 'POST') {
        response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(data));
      } else if (method == 'PUT') {
        response = await http.put(Uri.parse(url), headers: headers, body: jsonEncode(data));
      } else if (method == 'DELETE') {
        response = await http.delete(Uri.parse(url), headers: headers);
      }

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Error: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}

