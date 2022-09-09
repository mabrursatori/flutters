part of 'models.dart';

class MovieDetail extends Movie {
  final List<String> genres;
  final String language;

  MovieDetail(Movie movie, {this.genres, this.language})
      : super(
            id: movie.id,
            title: movie.title,
            voteAverage: movie.voteAverage,
            overview: movie.overview,
            posterPath: movie.posterPath,
            backdropPath: movie.backdropPath);

  String get genresAndLanguage {
    String s = "";

    for (var genre in genres) {
      s += genre + (genre != genres.last ? ',' : '');
    }

    return "$s - $language";
  }

  Map<String, dynamic> toJson() => {
        "genres": jsonEncode(genres),
        "language": language,
        "id": id,
        "title": title,
        "voteAverage": voteAverage,
        "overview": overview,
        "posterPath": posterPath,
        "backdropPath": backdropPath
      };

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
        Movie(
            id: json["id"],
            title: json["title"],
            voteAverage: (json["voteAverage"] as num).toDouble(),
            overview: json["overview"],
            posterPath: json["posterPath"],
            backdropPath: json["backdropPath"]),
        genres: (jsonDecode(json["genres"]) as List)
            .map((e) => e.toString())
            .toList(),
        language: json["language"]);
  }

  @override
  List<Object> get props => super.props + [genres, language];
}
