// ignore_for_file: unnecessary_null_comparison

class Result {
  final String originalLanguage;

  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  get fullPosterImg{
    if(posterPath != null){
      return "https://image.tmdb.org/t/p/w500${posterPath}";
    }else{
      return "https://i.pinimg.com/originals/88/99/7e/88997e72673d6d7d55a9c998217befd6.jpg";
    }
  }
  get thereTitle{
    if(title != null){
      return title;
    }else{
      return "";
    }
  }

  get fullBackdropPath{
    if(backdropPath != null){
      return "https://image.tmdb.org/t/p/w500${backdropPath}";
    }else{
      return "https://png.pngtree.com/thumb_back/fw800/background/20200821/pngtree-black-solid-color-background-image_396552.jpg";
    }
  }

  bool? adult;
  String? backdropPath;
  List<int> genreIds;
  int? id;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    originalLanguage:json["original_language"]!,
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"]?.toDouble(),
    posterPath: json["poster_path"],
    releaseDate: DateTime.parse(json["release_date"]),
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "id": id,
    "original_language": "",
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "release_date":
        "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}