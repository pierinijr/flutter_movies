import 'package:flutter/material.dart';
import 'package:flutter_movies/model/now_playing_model.dart';
import 'package:flutter_movies/services/api_response.dart';
import 'package:flutter_movies/services/api_status.dart';
import 'package:flutter_movies/services/now_playing_services.dart';

class NowPlayingViewModel extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');
  int _page = 1;

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> fetchNowPlayingMovieData(
      {String language = "pt-BR"}) async {
    if (_apiResponse.status != Status.completed) {
      _apiResponse = ApiResponse.loading('Fetching Movies');
      notifyListeners();
    } else {
      _apiResponse.status = Status.loading;
    }
    try {
      List<Results>? oldResults;
      
      if (_apiResponse.data != null) {
        _page += 1;
        oldResults = _apiResponse.data.response.results;
      }

      var movies = await NowPlayingServices.getNowPlayingMovies(language, _page,
          oldResults: oldResults);

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
