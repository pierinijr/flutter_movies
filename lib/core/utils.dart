import 'package:flutter/material.dart';
import 'package:flutter_movies/model/now_playing_model.dart';
import 'package:flutter_movies/view_model/favorites_view_model.dart';
import 'package:flutter_movies/view_model/now_playing_view_model.dart';
import 'package:provider/provider.dart';

class Utils {
  static void goView(BuildContext context, String name,
      {Object? arguments, bool removeUntil = false}) {
    if (name.startsWith("/home")) {
      removeUntil = true;
    }

    if (!removeUntil) {
      Navigator.pushNamed(context, name, arguments: arguments);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, name, (route) => false,
          arguments: arguments);
    }
  }

  static String getTimeString(int value) {
    final int hour = value ~/ 60;
    final int minutes = value % 60;
    return '${hour.toString().padLeft(2, "0")}h ${minutes.toString().padLeft(2, "0")}m';
  }

  static bool verifyCurrentRoute(BuildContext context, String validation) {
    var route = ModalRoute.of(context);

    if (route != null) {
      return (route.settings.name ?? "").contains(validation);
    }

    return false;
  }

  static bool isFavorite(BuildContext context, int? id) {
    if (id != null) {
      bool isFavorite = Provider.of<FavoritesViewModel>(context, listen: false)
        .verifyFavorite(id);
      return isFavorite;
    }
    return false;
  }

  static void changeFavorite(BuildContext context, int? id, bool isLiked) {
    if (id != null) {
      if (isLiked) {
        Provider.of<FavoritesViewModel>(context, listen: false).deleteFavorite(id);
      } else {
        Results favorite = Provider.of<NowPlayingViewModel>(context, listen: false)
          .response.data.response.results.firstWhere((favorite) => favorite.id == id);
        Provider.of<FavoritesViewModel>(context, listen: false).insertFavorite(favorite);
      }
    }
  }

  static String dateConvert(String date) {
    return date.split("-").reversed.join("-");
  }
}
