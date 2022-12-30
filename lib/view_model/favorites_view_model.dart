import 'package:flutter/material.dart';
import 'package:flutter_movies/database/app_database.dart';
import 'package:flutter_movies/model/now_playing_model.dart';

class FavoritesViewModel extends ChangeNotifier {
  List<Results> _favorites = [];

  List<Results> get favorites {
    return _favorites;
  }

  Future<void> getAllFavorites() async {
    _favorites = await AppDatabase.getAllFavorites();
    notifyListeners();
  }

  Future<void> insertFavorite(Results favorite) async {
    try {
      await AppDatabase.insertFavorite(favorite);
      await getAllFavorites();
      notifyListeners();
    } catch(e) {
      debugPrint("Error: insertFavorite");
      debugPrint(e.toString());
    }
  }

  Future<void> deleteFavorite(int id) async {
    try {
      await AppDatabase.deleteFavorite(id);
      await getAllFavorites();
      notifyListeners();
    } catch(e) {
      debugPrint("Error: deleteFavorite");
      debugPrint(e.toString());
    }
  }

  bool verifyFavorite(int id) {
    List verify = _favorites.where((favorite) => favorite.id == id).toList();
    return verify.isNotEmpty;
  }
}