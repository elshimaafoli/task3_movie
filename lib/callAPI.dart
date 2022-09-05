import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_app/Movie.dart';

class CallAPI {
  Future<List<MovieModel>> getMovies() async {
    List<MovieModel> movies = [];
    //https://api.themoviedb.org/3/movie/popular?api_key=eb03df251074313f6e24c705f23a1cdc
    Uri path = Uri.https('api.themoviedb.org', '/3/movie/popular', {
      "api_key": "eb03df251074313f6e24c705f23a1cdc",
    });
    http.Response response = await http.get(path);
    print(response.body);
    if (response.statusCode == 200) {
      var converted = jsonDecode(response.body);
      var temp = converted["results"] as List;
      movies = temp
          .map((elem) => MovieModel(
              title: elem['title'],
              id: elem['id'],
              image: elem['poster_path'],
              popularity: elem['popularity']))
          .toList();
    }
    else{
      print('false');
    }
    return movies;
  }
  Future<MovieModel> getMovie(int id) async {
    MovieModel movie= MovieModel(title: '', id: 0, image: '', popularity: 0.0);
    Uri path = Uri.https('api.themoviedb.org', '/3/movie/${id}', {
      "api_key": "eb03df251074313f6e24c705f23a1cdc",
    });
    http.Response response = await http.get(path);
    print(response.body);
    if (response.statusCode == 200) {
      var converted = jsonDecode(response.body);
      movie= converted["results"];
      print(movie.title);
      return movie;
    }
    else{
      print('false');
    }
    return movie;
  }

}
