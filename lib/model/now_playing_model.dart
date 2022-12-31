import 'package:flutter_movies/core/utils.dart';

class NowPlayingModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  NowPlayingModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  factory NowPlayingModel.fromJson(Map<String, dynamic> json) {
    List<Results> results = <Results>[];
    if (json['results'] != null) {
      json['results'].forEach((result) {
        Results dataResult = Results.fromJson(result);
        if (dataResult.backdropPath != null &&
            dataResult.title != null &&
            dataResult.posterPath != null) {
          results.add(dataResult);
        }
      });
    }

    return NowPlayingModel(
        page: json['page'] ?? 0,
        results: results,
        totalPages: json['total_pages'] ?? 0,
        totalResults: json['total_results'] ?? 0);
  }
}

class Results {
  String? backdropPath;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Results(
      {this.backdropPath,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      backdropPath: json['backdrop_path'] ?? "",
      id: json['id'] ?? 0,
      originalLanguage: json['original_language'] ?? "",
      originalTitle: json['original_title'] ?? "",
      popularity: json['popularity'].toDouble() ?? 0,
      posterPath: json['poster_path'] ?? "",
      releaseDate: Utils.dateConvert(json['release_date']),
      title: json['title'] ?? "",
      video: json['video'] ?? false,
      voteAverage: json['vote_average'].toDouble() ?? 0,
      voteCount: json['vote_count'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'releaseDate': releaseDate,
      'voteAverage': voteAverage,
      'posterPath': posterPath,
    };
  }
}
