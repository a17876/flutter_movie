import 'package:flutter/material.dart';
import 'package:flutter_movie/services/api_service.dart';

import '../models/popular_model.dart';
import '../widgets/movie_card.dart';
import '../widgets/movie_category.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<PopularModel>> movies = ApiService.getPopularMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 80, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MovieCategory(
                category: "Popular Movies",
              ),
              MovieCard(
                movies: movies,
                height: 180,
                width: 250,
              ),
              const MovieCategory(
                category: "Now In Cinemas",
              ),
              MovieCard(movies: movies, height: 100, width: 100),
              const MovieCategory(
                category: "Coming Soon",
              ),
              MovieCard(movies: movies, height: 100, width: 100),
            ],
          ),
        ),
      ),
    );
  }
}
