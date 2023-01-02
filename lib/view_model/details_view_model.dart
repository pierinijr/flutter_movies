import 'package:flutter/material.dart';
import 'package:flutter_movies/repository/api_response.dart';
import 'package:flutter_movies/repository/api_status.dart';
import 'package:flutter_movies/repository/details_repository.dart';

class DetailsViewModel extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> fetchDetailsMovieData(int? movieId, {String language = "pt-BR"}) async {
    _apiResponse = ApiResponse.loading('Fetching Detail');
    notifyListeners();
    try {
      if (movieId == null) {
        _apiResponse = ApiResponse.error("movieId error");
      }
      var details = await DetailsRepository.getDetailsMovie(language, movieId!);
      if (details is Success) {
        _apiResponse = ApiResponse.completed(details);
      }

      if (details is Failure) {
        _apiResponse = ApiResponse.error(details.errorResponse.toString());
        debugPrint(_apiResponse.toString());
      }
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      debugPrint(e.toString());
    }
    notifyListeners();
  }
}