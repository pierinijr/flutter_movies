import 'package:flutter_movies/model/lists_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static Future<Database> createDataBase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'favorites_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE IF NOT EXISTS favorites('
          'id INTEGER PRIMARY KEY, '
          'title STRING, '
          'releaseDate STRING, '
          'voteAverage DOUBLE, '
          'posterPath STRING)',
        );
      },
      version: 1,
    );
  }

  static Future<List<Results>> getAllFavorites() async {
    final db = await createDataBase();

    final List<Map<String, dynamic>> maps = await db.query('favorites');

    return List.generate(maps.length, (i) {
      return Results(
        id: maps[i]['id'],
        title: maps[i]['title'],
        releaseDate: maps[i]['releaseDate'],
        voteAverage: maps[i]['voteAverage'],
        posterPath: maps[i]['posterPath'],
      );
    });
  }

  static Future<void> insertFavorite(Results favorite) async {
    final db = await createDataBase();

    await db.insert(
      'favorites',
      favorite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteFavorite(int id) async {
    final db = await createDataBase();

    await db.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
