import 'dart:convert';
import 'package:proyecto_mvc/src/model/movie.dart';
import 'package:proyecto_mvc/src/utils/api_moviedb_utils.dart';



class MovieService {
  final TMDbAPI _tmdbApi = TMDbAPI();

  Future<List<Movie>?> list(String query) async {
    try {
      final response = await _tmdbApi.get('search/movie', queryParams: {'query': query});
      if (response != null && response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['results'];
        return data.map((json) => Movie.fromJson(json)).toList();
      } else {
        print('Error al obtener las películas: ${response?.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error al obtener las películas: $e');
      return null;
    }
  }

  Future<Movie?> create(Map<String, dynamic> data) async {
    try {
      final response = await _tmdbApi.post('movie', body: data);
      if (response != null && response.statusCode == 201) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return Movie.fromJson(jsonData);
      } else {
        print('Error al crear la película: ${response?.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error al crear la película: $e');
      return null;
    }
  }

  Future<Movie?> read(int id) async {
    try {
      final response = await _tmdbApi.get('movie/$id');
      if (response != null && response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return Movie.fromJson(jsonData);
      } else {
        print('Error al obtener la película: ${response?.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error al obtener la película: $e');
      return null;
    }
  }

  Future<Movie?> update(int id, Map<String, dynamic> data) async {
    try {
      final response = await _tmdbApi.put('movie/$id', body: data);
      if (response != null && response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return Movie.fromJson(jsonData);
      } else {
        print('Error al actualizar la película: ${response?.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error al actualizar la película: $e');
      return null;
    }
  }

  Future<bool> delete(int id) async {
    try {
      final response = await _tmdbApi.delete('movie/$id');
      if (response != null && response.statusCode == 204) {
        return true;
      } else {
        print('Error al eliminar la película: ${response?.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error al eliminar la película: $e');
      return false;
    }
  }
}