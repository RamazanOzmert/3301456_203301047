import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:marketapp/globalStates/favorites.dart';

class SqlFavorite {
  dynamic database;
  Future<void> open() async {
    WidgetsFlutterBinding.ensureInitialized();
    database = openDatabase(
      join(await getDatabasesPath(), 'marketapp_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorites(id INTEGER PRIMARY KEY, prdId TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertFavorite(Favorite fav) async {
    await open();
    final db = await database;
    await db.insert(
      "favorites",
      fav.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Favorite>> favorites() async {
    await open();
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("favorites");
    return List.generate(maps.length, (i) {
      return Favorite(
        prdId: maps[i]['prdId'],
      );
    });
  }

  Future<void> updateFavorite(Favorite fav) async {
    await open();
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'favorites',
      fav.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [fav.prdId],
    );
  }

  Future<void> deleteFavorite(String prdId) async {
    await open();
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'favorites',
      // Use a `where` clause to delete a specific dog.
      where: 'prdId = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [prdId],
    );
  }
}
