import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/model/lists_model.dart';
import 'package:flutter_movies/repository/api.dart';
import 'package:flutter_movies/repository/api_status.dart';

class ListsRepository {
  static String apiKey = Constants.environment.apiKey;
  static String movieSearch = Constants.endpoints.movie;

  static Future getListsMovies(String? language,
      {List<ListsModel>? oldResults, String? listType}) async {
    List<String> movieLists = [
      "now_playing",
      "top_rated",
      "upcoming",
      "popular"
    ];

    List<ListsModel> listDataModel = [];

    if (oldResults != null && listType != null) {
      listDataModel = oldResults;
      ListsModel data =
          listDataModel.firstWhere((item) => item.type == listType);

      int page = (data.page ?? 0) + 1;

      var jsonData = await Api.getMovies(language: language, listType: listType, page: page);

      ListsModel dataModel = ListsModel.fromJson(jsonData, listType);
      for (var list in listDataModel) {
        if (list.type == listType) {
          list.page = page;
          list.results = [...?data.results, ...?dataModel.results];
        }
      }

      return Success(response: listDataModel);
    }

    for (var list in movieLists) {
      var jsonData = await Api.getMovies(language: language, listType: list, page: 1);

      if (jsonData.runtimeType == Failure) {
        return jsonData;
      }
      
      ListsModel dataModel = ListsModel.fromJson(jsonData, list);
      listDataModel.add(dataModel);
    }

    if (listDataModel.isEmpty) {
      return Failure(
          code: Constants.statusCode.userInvalidResponse,
          errorResponse: 'Invalid Response');
    }

    return Success(response: listDataModel);
  }
}
