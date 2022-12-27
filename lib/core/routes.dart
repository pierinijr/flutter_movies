import 'package:flutter/material.dart';
import 'package:flutter_movies/view/screens/view_home.dart';

final Map<String, WidgetBuilder> routes = {
  "/home": (context) => const ViewHome(),
  // "/favorites": (context) => const ViewFavorites(),
};