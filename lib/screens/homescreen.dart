import 'package:flutter/material.dart';
import 'package:flutter_movie/services/api_service.dart';

import '../models/moviecard_model.dart';
import '../widgets/movie_card.dart';
import '../widgets/movie_category.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieCardModel>> popularMovies =
      ApiService.getMovies("popular");
  final Future<List<MovieCardModel>> nowMovies =
      ApiService.getMovies("now-playing");
  final Future<List<MovieCardModel>> soonMovies =
      ApiService.getMovies("coming-soon");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MovieCategory(
                category: "Popular Movies",
              ),
              MovieCard(
                movies: popularMovies,
                height: 180,
                width: 250,
              ),
              const MovieCategory(
                category: "Now In Cinemas",
              ),
              MovieCard(movies: nowMovies, height: 100, width: 100),
              const MovieCategory(
                category: "Coming Soon",
              ),
              MovieCard(movies: soonMovies, height: 100, width: 100),
            ],
          ),
        ),
      ),
    );
  }
}
