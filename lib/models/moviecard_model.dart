class MovieCardModel {
  final String title, thumb, id;
  static const String thumbBaseUrl = "https://image.tmdb.org/t/p/w500";

  MovieCardModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = '$thumbBaseUrl${json['poster_path']}',
        id = json['id'].toString();
}
