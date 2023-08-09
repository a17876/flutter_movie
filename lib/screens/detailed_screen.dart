import 'package:flutter/material.dart';
import 'package:flutter_movie/models/detailed_model.dart';
import 'package:flutter_movie/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.id,
    required this.title,
  });

  final String id, title;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final Future<DetailedModel> movie;

  @override
  void initState() {
    super.initState();
    movie = ApiService.getMovieById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.blueGrey,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: movie,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: 250,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Image.network(snapshot.data!.thumb),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    snapshot.data!.title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(snapshot.data!.overview),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                          "${snapshot.data!.adult ? "Childeren" : "Adult"}/${snapshot.data!.originalTitle}"),
                    ],
                  ),
                ],
              ),
            );
          }
          return const Text('...');
        },
      ),
    );
  }
}
