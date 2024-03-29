import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketapp/sqflite/sql_favorites.dart';

final favoriteProvider =
    StateNotifierProvider<BasketNotifier, List<Favorite>>((ref) {
  return BasketNotifier(favorites: [
    Favorite(
      prdId: "-1",
    ),
    Favorite(
      prdId: "1",
    ),
  ]);
});

@immutable
class Favorite {
  final String prdId; // 'product' must be

  const Favorite({
    required this.prdId,
  });

  Map<String, dynamic> toMap() {
    return {
      'prdId': prdId,
    };
  }

  Favorite copyWith({
    String? prdId,
  }) {
    return Favorite(
      prdId: prdId ?? this.prdId,
    );
  }
}

class BasketNotifier extends StateNotifier<List<Favorite>> {
  BasketNotifier({favorites}) : super(favorites);
  SqlFavorite sql = new SqlFavorite();
  //add favorite list
  void update(Favorite favorite) {
    var prdId = favorite.prdId;
    var isIn;
    for (final item in state) {
      if (item.prdId == prdId) {
        isIn = true;
        break;
      } else {
        isIn = false;
      }
    }

    if (isIn)
      remove(favorite.prdId);
    else
      add(favorite);
  }

  void add(Favorite favorite) {
    sql.insertFavorite(favorite);
    state = [...state, favorite];
  }

  //remove favorite list
  void remove(String prdId) {
    sql.deleteFavorite(prdId);
    state = [
      for (final item in state)
        if (item.prdId != prdId) item
    ];
  }
}
