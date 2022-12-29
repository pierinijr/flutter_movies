import 'package:flutter/material.dart';
import 'package:flutter_movies/model/list_arguments_model.dart';
import 'package:flutter_movies/view/screens/view_detail.dart';
import 'package:flutter_movies/view/screens/view_home.dart';
import 'package:flutter_movies/view/screens/view_list.dart';
import 'package:flutter_movies/view/screens/view_splash.dart';

final Map<String, WidgetBuilder> routes = {
  "/": (context) => const ViewSplash(),
  "/home": (context) => const ViewHome(),
  "/list": (context) => ViewList(
    listDetail: ModalRoute.of(context)!.settings.arguments as ListArgumentsModel
  ),
  "/detail": (context) => ViewDetail(
    movieId: ModalRoute.of(context)!.settings.arguments as int
  ),
  // "/favorites": (context) => const ViewFavorites(),
};