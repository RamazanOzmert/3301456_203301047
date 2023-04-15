import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final basketsProvider =
    StateNotifierProvider<BasketNotifier, List<Basket>>((ref) {
  return BasketNotifier(baskets: [
    Basket(prdId: "-1", total: "1"),
  ]);
});

@immutable
class Basket {
  final String prdId; // 'product' must be
  final String total;

  const Basket({
    required this.prdId,
    required this.total,
  });

  Basket copyWith({
    String? prdId,
    String? total,
  }) {
    return Basket(
      prdId: prdId ?? this.prdId,
      total: total ?? this.total,
    );
  }
}

class BasketNotifier extends StateNotifier<List<Basket>> {
  BasketNotifier({baskets}) : super(baskets);

  void add(Basket basket) {
    var isIn = true;
    for (final item in state) {
      if (item.prdId == basket.prdId) {
        increase(prdId: basket.prdId);
        isIn = false;
        break;
      }
    }
    if (isIn) {
      state = [...state, basket];
      isIn = false;
    }
  }

  void decrease({required String prdId}) {
    var i = 0;
    for (final item in state) {
      if (item.prdId == prdId) {
        var t = int.parse(item.total) - 1;
        if (t == 0) {
          state = [
            for (final item in state)
              if (item.prdId != prdId) item
          ];
        }
        Basket basket = Basket(prdId: prdId, total: t.toString());
        state = [
          for (final item in state)
            if (item.prdId == prdId)
              item.copyWith(
                total: t.toString(),
              )
            else
              item
        ];
        break;
      }
      i += 1;
    }
  }

  void increase({required String prdId}) {
    var i = 0;
    for (final item in state) {
      if (item.prdId == prdId) {
        var t = int.parse(item.total) + 1;
        Basket basket = Basket(prdId: prdId, total: t.toString());
        state = [
          for (final item in state)
            if (item.prdId == prdId)
              item.copyWith(
                total: t.toString(),
              )
            else
              item
        ];
        break;
      }
      i += 1;
    }
  }
}
