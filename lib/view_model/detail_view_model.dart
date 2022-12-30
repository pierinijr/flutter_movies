import 'package:flutter/material.dart';
import 'package:flutter_movies/services/api_response.dart';
import 'package:flutter_movies/services/api_status.dart';
import 'package:flutter_movies/services/details_services.dart';

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
      var details = await DetailsServices.getDetailsMovie(language, movieId!);
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