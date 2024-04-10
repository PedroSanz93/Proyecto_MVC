import 'package:proyecto_mvc/src/utils/APIutils.dart';

class TMDbAPI {
  final String apiKey = '1eaa2da538ee011defaf03a05766a1e4'; 
  static const String baseUrl = 'https://api.themoviedb.org/3/movie';

  Future<List<dynamic>?> getAllMovies() async {
    var fullUrl = '$baseUrl/popular?api_key=$apiKey';
    var api = APIUtils(fullUrl);
    var response = await api.call();
    return response != null ? response['results'] : null;
  }
  
}
