import 'package:flutter_movies/core/utils.dart';

class DetailsModel {
  String? backdropPath;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  int? revenue;
  int? runtime;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  Videos? videos;

  DetailsModel(
      {this.backdropPath,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.videos});

  DetailsModel.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = Utils.dateConvert(json['release_date']);
    revenue = json['revenue'];
    runtime = json['runtime'];
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    videos = json['videos'] != null ? Videos.fromJson(json['videos']) : null;
  }
}

class Genres {
  int? id;
  String? name;
  Genres({this.id, this.name});
  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Videos {
  Videos({this.results});

  List<VideoResults>? results;

  Videos.fromJson(Map<String, dynamic> json) {
    List<String> type = ["Teaser", "Trailer", "Clip"];
    if (json['results'] != null) {
      results = <VideoResults>[];
      json['results'].forEach((video) {
        if (video["site"].contains("YouTube") && type.contains(video["type"])) {
          results!.add(VideoResults.fromJson(video));
        }
      });
    }
  }
}

class VideoResults {
  String? name;
  String? key;
  String? site;
  String? type;
  String? publishedAt;

  VideoResults({
    this.name,
    this.key,
    this.site,
    this.type,
    this.publishedAt,
  });

  VideoResults.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    key = json['key'];
    site = json['site'];
    type = json['type'];
    publishedAt = json['published_at'];
  }
}
