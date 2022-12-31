import 'dart:io';

import 'package:flutter_movies/extension/response.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/model/now_playing_model.dart';
import 'package:flutter_movies/services/api_status.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NowPlayingServices {
  static String apiKey = Constants.environment.apiKey;
  static String movieSearch = Constants.endpoints.movieSearch;

  static Future getNowPlayingMovies(String language, int page,
      {List<Results>? oldResults}) async {
    Response response;

    try {
      language = language.isNotEmpty ? "&language=$language" : "";
      response = await http
          .get(Uri.parse("$movieSearch?api_key=$apiKey$language&page=$page"));
      if (response.statusCode == Constants.statusCode.userInvalidResponse) {
        return Failure(
            code: Constants.statusCode.userInvalidResponse,
            errorResponse: 'Invalid Response');
      }

      var jsonData = response.getData();

      NowPlayingModel dataModel = NowPlayingModel.fromJson(jsonData);
      if (oldResults != null) {
        dataModel.results = [...oldResults, ...?dataModel.results];
      }
      return Success(response: dataModel);
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
