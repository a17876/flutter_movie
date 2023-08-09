import 'dart:convert';

import 'package:flutter_movie/models/detailed_model.dart';
import 'package:flutter_movie/models/moviecard_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "https://movies-api.nomadcoders.workers.dev";

  static Future<List<MovieCardModel>> getMovies(category) async {
    List<MovieCardModel> moviesInstances = [];
    final url = Uri.parse('$baseUrl/$category');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final moviesResponse = jsonDecode(response.body);
      final movies = moviesResponse["results"];
      for (var movie in movies) {
        moviesInstances.add(MovieCardModel.fromJson(movie));
      }

      return moviesInstances;
    }
    throw Error();
  }

  static Future<DetailedModel> getMovieById(String id) async {
    final url = Uri.parse('$baseUrl/movie?id=$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final movieResponse = jsonDecode(response.body);

      return DetailedModel.fromJson(movieResponse);
    }
    throw Error();
  }
}
