import 'package:flutter/material.dart';
import 'package:flutter_movies/view/screens/view_home.dart';
import 'package:flutter_movies/view/screens/view_splash.dart';

final Map<String, WidgetBuilder> routes = {
  "/": (context) => const ViewSplash(),
  "/home": (context) => const ViewHome(),
  // "/favorites": (context) => const ViewFavorites(),
};