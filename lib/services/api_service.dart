import 'dart:convert';

import 'package:flutter_movie/models/popular_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "https://movies-api.nomadcoders.workers.dev";

  static Future<List<PopularModel>> getMovies(category) async {
    List<PopularModel> moviesInstances = [];
    final url = Uri.parse('$baseUrl/$category');
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
