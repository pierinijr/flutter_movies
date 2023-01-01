import 'dart:io';

import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/extension/response.dart';
import 'package:flutter_movies/repository/api_status.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Api {
  static Future getMovies(
      {String? listType,
      int? movieId,
      String? language,
      int? page,
      String? listVideos}) async {
    try {
      String apiKey = Constants.environment.apiKey;
      String movieSearch = Constants.endpoints.movie;

      String? uri;

      language = language != null ? "&language=$language" : "";

      if (movieId != null && listVideos != null) {
        uri = "$movieSearch$movieId?api_key=$apiKey$language$listVideos";
      }

      if (listType != null && page != null) {
        uri = "$movieSearch$listType?api_key=$apiKey$language&page=$page";
      }

      if (uri != null) {
        Response response = await http.get(Uri.parse(uri));

        if (response.statusCode != Constants.statusCode.success) {
          return Failure(
              code: response.statusCode,
              errorResponse: 'Error');
        }

        var jsonData = response.getData();

        return jsonData;
      }

      return Failure(
          code: Constants.statusCode.noInternet,
          errorResponse: 'Invalid api parameters');
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
