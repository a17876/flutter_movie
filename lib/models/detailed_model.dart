class DetailedModel {
  final String title, thumb, id, originalTitle, overview;
  final bool adult;
  static const String thumbBaseUrl = "https://image.tmdb.org/t/p/w500";

  DetailedModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = '$thumbBaseUrl${json['poster_path']}',
        id = json['id'].toString(),
        originalTitle = json['original_title'],
        overview = json['overview'],
        adult = json['adult'];
}
