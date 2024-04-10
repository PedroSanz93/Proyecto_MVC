import 'package:proyecto_mvc/src/model/movie.dart';
import 'package:proyecto_mvc/src/utils/api_moviedb_utils.dart';

class MovieService {
  final TMDbAPI _tmdbAPI = TMDbAPI();

  Future<List<Movie>> fetchMovies() async {
    try {
      final response = await _tmdbAPI.getAllMovies();
      if (response != null) {
        List<Movie> movies = [];
        for (var jsonMovie in response) {
          movies.add(Movie.fromJson(jsonMovie));
        }
        return movies;
      } else {
        throw Exception('Failed to fetch movies');
      }
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }
}
