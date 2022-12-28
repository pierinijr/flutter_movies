import 'package:flutter/material.dart';
import 'package:flutter_movies/model/movie_search_model.dart';
import 'package:flutter_movies/services/api_response.dart';
import 'package:flutter_movies/services/api_status.dart';
import 'package:flutter_movies/services/movie_services.dart';

class MovieSearchViewModel extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');
  MovieSearchModel? _movieSearch;

  ApiResponse get response {
    return _apiResponse;
  }

  MovieSearchModel? get movieSearch {
    return _movieSearch;
  }

  Future<void> fetchMovieSearchData() async {
    _apiResponse = ApiResponse.loading('Fetching data');
    notifyListeners();
    try {
      var mediaList = await MovieServices.getSearchMovies();
      if (response is Success) {
        _apiResponse = ApiResponse.completed(mediaList);
      }

      if (response is Failure) {
        _apiResponse = ApiResponse.error(response.toString());
        debugPrint(response.toString());
      }
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      debugPrint(e.toString());
    }
    notifyListeners();
  }
}