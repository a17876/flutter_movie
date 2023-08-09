import 'package:flutter/material.dart';
import 'package:flutter_movie/models/moviecard_model.dart';

import '../screens/detailed_screen.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movies,
    required this.height,
    required this.width,
  });

  final Future<List<MovieCardModel>> movies;

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: height + 100,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var movie = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => DetailScreen(
                          id: movie.id,
                          title: movie.title,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        clipBehavior: Clip.hardEdge,
                        height: height,
                        width: width,
                        child: Image.network(
                          movie.thumb,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 80,
                        width: width,
                        child: Text(
                          movie.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
