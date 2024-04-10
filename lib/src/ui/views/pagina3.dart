import 'package:flutter/material.dart';
import 'package:proyecto_mvc/src/model/movie.dart';
import 'package:proyecto_mvc/src/service/movie_service.dart';

class Pagina3 extends StatefulWidget {
  const Pagina3({Key? key}) : super(key: key);

  @override
  _Pagina3State createState() => _Pagina3State();
}

class _Pagina3State extends State<Pagina3> {
  final MovieService _movieService = MovieService();
  late Future<List<Movie>> _moviesFuture;

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    try {
      _moviesFuture = _movieService.fetchMovies();
    } catch (e) {
      print('Error fetching movies: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: FutureBuilder<List<Movie>>(
        future: _moviesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Movie> movies = snapshot.data ?? [];
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                Movie movie = movies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        // Posible lógica al hacer clic en la película
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Poster de la película
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: movie.posterPath.isNotEmpty
                                  ? Image.network(
                                      movie.getImage(),
                                      width: 100.0,
                                      height: 150.0,
                                      fit: BoxFit.cover,
                                    )
                                  : Container(
                                      width: 100.0,
                                      height: 150.0,
                                      color: Colors.grey[300],
                                      child: Icon(
                                        Icons.image_not_supported,
                                        size: 50.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Título de la película
                                  Text(
                                    movie.title,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  // Descripción de la película
                                  Text(
                                    movie.overview,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 10.0),
                                  // Otros detalles de la película
                                  Text(
                                    "Popularity: ${movie.popularity}",
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  Text(
                                    "Vote Average: ${movie.voteAverage}",
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  Text(
                                    "Release Date: ${movie.releaseDate}",
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
