import 'dart:io';

import 'package:flutter_movies/extension/response.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/model/lists_model.dart';
import 'package:flutter_movies/services/api_status.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ListsServices {
  static String apiKey = Constants.environment.apiKey;
  static String movieSearch = Constants.endpoints.movie;

  static Future<ListsModel> getListsModel(
      String language, String listType, int page) async {
    language = language.isNotEmpty ? "&language=$language" : "";
    Response response = await http.get(
        Uri.parse("$movieSearch$listType?api_key=$apiKey$language&page=$page"));

    var jsonData = response.getData();

    ListsModel dataModel = ListsModel.fromJson(jsonData, listType);
    return dataModel;
  }

  static Future getListsMovies(String language,
      {List<ListsModel>? oldResults, String? listType}) async {

    List<String> movieLists = [
      "now_playing",
      "top_rated",
      "upcoming",
      "popular"
    ];

    List<ListsModel> listDataModel = [];

    try {
      if (oldResults != null && listType != null) {
        listDataModel = oldResults;
        ListsModel data = listDataModel.firstWhere((item) => item.type == listType);

        int page = (data.page ?? 0) + 1;

        ListsModel dataModel = await getListsModel(language, listType, page);
        for (var list in listDataModel) {
          if (list.type == listType) {
            list.page = page;
            list.results = [...?data.results, ...?dataModel.results];
          }
        }

        return Success(response: listDataModel);
      }

      
      for (var list in movieLists) {
        ListsModel dataModel = await getListsModel(language, list, 1);
        listDataModel.add(dataModel);
      }

      if (listDataModel.isEmpty) {
        return Failure(
            code: Constants.statusCode.userInvalidResponse,
            errorResponse: 'Invalid Response');
      }

      return Success(response: listDataModel);
    } on HttpException {
      return Failure(
          code: Constants.statusCode.noInternet,
          errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: Constants.statusCode.noInternet,
          errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(
          code: Constants.statusCode.invalidFormat,
          errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(
          code: Constants.statusCode.unknownError,
          errorResponse: 'Unknown Error');
    }
  }
}
