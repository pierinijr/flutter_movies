import 'package:flutter/material.dart';
import 'package:flutter_movies/services/api_response.dart';
import 'package:flutter_movies/services/api_status.dart';
import 'package:flutter_movies/services/now_playing_services.dart';

class NowPlayingViewModel extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> fetchNowPlayingMovieData({String language = "pt-BR", int page = 1}) async {
    _apiResponse = ApiResponse.loading('Fetching Movies');
    notifyListeners();
    try {
      var movies = await NowPlayingServices.getNowPlayingMovies(language, page);
      if (movies is Success) {
        _apiResponse = ApiResponse.completed(movies);
      }

      if (movies is Failure) {
        _apiResponse = ApiResponse.error(movies.errorResponse.toString());
        debugPrint(_apiResponse.toString());
      }
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      debugPrint(e.toString());
    }
    notifyListeners();
  }
}