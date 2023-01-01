import 'package:flutter/material.dart';
import 'package:flutter_movies/model/lists_model.dart';
import 'package:flutter_movies/repository/api_response.dart';
import 'package:flutter_movies/repository/api_status.dart';
import 'package:flutter_movies/repository/lists_repository.dart';

class ListsViewModel extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> fetchListsData(
      {String language = "pt-BR", String? listType}) async {
    if (_apiResponse.status != Status.completed) {
      _apiResponse = ApiResponse.loading('Fetching Movies');
      notifyListeners();
    } else {
      _apiResponse.status = Status.loading;
    }
    try {
      List<ListsModel>? oldResults;
      
      if (_apiResponse.data != null) {
        oldResults = _apiResponse.data.response;
      }

      var movies = await ListsRepository.getListsMovies(language,
          oldResults: oldResults, listType: listType);

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
