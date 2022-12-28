import 'dart:io';

import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/model/movie_search_model.dart';
import 'package:flutter_movies/services/api_status.dart';
import 'package:http/http.dart' as http;

class MovieServices {
  static String apiKey = Constants.environment.apiKey;
  static String movieSearch = Constants.endpoints.movieSearch;
  static String movieDetails = Constants.endpoints.movieDetails;

  static Future getSearchMovies({String language = ""}) async {
    dynamic response;

    try {
      response = await http.get(Uri.parse("$movieSearch?api_key=$apiKey$language"));
      if (response.statusCode == Constants.statusCode.success) {
        return Success(response: MovieSearchModel.fromJson(response.body));
      }

      return Failure(
          code: Constants.statusCode.userInvalidResponse,
          errorResponse: 'Invalid Response');
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
