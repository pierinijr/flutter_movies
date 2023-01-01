import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/model/details_model.dart';
import 'package:flutter_movies/repository/api.dart';
import 'package:flutter_movies/repository/api_status.dart';

class DetailsRepository {
  static String apiKey = Constants.environment.apiKey;
  static String movieDetails = Constants.endpoints.movie;
  static String listVideos = Constants.endpoints.listVideoParameter;

  static Future getDetailsMovie(String? language, int movieId) async {
    var jsonData =
        await Api.getMovies(language: language, movieId: movieId, listVideos: listVideos);

    if (jsonData.runtimeType == Failure) {
      return jsonData;
    }

    return Success(response: DetailsModel.fromJson(jsonData));
  }
}
