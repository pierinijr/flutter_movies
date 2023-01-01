import 'package:flutter/material.dart';
import 'package:flutter_movies/languages/generated/app_localizations.dart';
import 'package:flutter_movies/model/lists_model.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:flutter_movies/view_model/favorites_view_model.dart';
import 'package:flutter_movies/view_model/lists_view_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
        Provider.of<FavoritesViewModel>(context, listen: false)
            .deleteFavorite(id);
      } else {
        List<ListsModel> favorite =
            Provider.of<ListsViewModel>(context, listen: false)
                .response
                .data
                .response;

        Results results = Results();

        for (var element in favorite) {
            results = element.results!.firstWhere(
              (favorite) => favorite.id == id, 
              orElse: () => Results());
          if (results.id != null) break;
        }
        
        if (results.id != null) {
          Provider.of<FavoritesViewModel>(context, listen: false)
              .insertFavorite(results);
        }
      }
    }
  }

  static String dateConvert(String? date) {
    if (date == null) {
      return "";
    }
    date = DateTime.parse(date).toString().split(" ")[0];
    return date.split("-").reversed.join("-");
  }

  static String listTitle(BuildContext context, String type) {
    String title = "";

    switch (type) {
      case "latest":
        title = AppLocalizations.of(context)!.latest;
        break;
      case "now_playing":
        title = AppLocalizations.of(context)!.nowPlaying;
        break;
      case "popular":
        title = AppLocalizations.of(context)!.popular;
        break;
      case "top_rated":
        title = AppLocalizations.of(context)!.topRated;
        break;
      case "upcoming":
        title = AppLocalizations.of(context)!.upcoming;
        break;
      default:
        title = "";
    }

    return title;
  }

  static void showToast(String message) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: AppColors.primaryFavorite,
        textColor: AppColors.labelPrimaryColor,
        fontSize: 12);
  }
}
