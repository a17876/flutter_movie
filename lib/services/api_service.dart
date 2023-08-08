import 'dart:convert';

import 'package:flutter_movie/models/popular_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const popular = "popular";

  static Future<List<PopularModel>> getPopularMovies() async {
    List<PopularModel> moviesInstances = [];
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final moviesResponse = jsonDecode(response.body);
      final movies = moviesResponse["results"];
      for (var movie in movies) {
        moviesInstances.add(PopularModel.fromJson(movie));
      }

      return moviesInstances;
    }
    throw Error();
  }
}
