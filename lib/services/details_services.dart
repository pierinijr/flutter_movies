import 'dart:io';

import 'package:flutter_movies/extension/response.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/model/details_model.dart';
import 'package:flutter_movies/services/api_status.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DetailsServices {
  static String apiKey = Constants.environment.apiKey;
  static String movieDetails = Constants.endpoints.movieDetails;
  static String listVideos = Constants.endpoints.listVideoParameter;

  static Future getDetailsMovie(String language, int movieId) async {
    Response response;

    try {
      language = language.isNotEmpty ? "&language=$language" : "";
      response = await http.get(
        Uri.parse("$movieDetails$movieId?api_key=$apiKey$language$listVideos"));
      if (response.statusCode == Constants.statusCode.userInvalidResponse) {
        return Failure(
          code: Constants.statusCode.userInvalidResponse,
          errorResponse: 'Invalid Response');
      }

      var jsonData = response.getData();
      return Success(response: DetailsModel.fromJson(jsonData));
      
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
