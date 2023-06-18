import 'package:flutter/material.dart';
import 'package:marketapp/globalStates/address.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketapp/globalStates/favorites.dart';
import 'package:marketapp/util/products.dart';

import 'package:marketapp/widgets/address_item.dart';
import 'package:marketapp/widgets/favorite_item.dart';

class UserFavorites extends ConsumerStatefulWidget {
  const UserFavorites({Key? key}) : super(key: key);

  ConsumerState<UserFavorites> createState() => _UserFavorites();
}

class _UserFavorites extends ConsumerState<UserFavorites> {
  @override
  void initState() {
    super.initState();
  }

  var favoriteItems = [];
  getPrd() {
    var favorites = ref.watch(favoriteProvider);
    var lis = [];
    favorites.forEach((item) {
      products.forEach((p) {
        if (item.prdId == p['id']) lis.add(p);
      });
    });
    favoriteItems = lis;
  }

  @override
  Widget build(BuildContext context) {
    var fav = ref.watch(favoriteProvider);
    getPrd();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5AA9E6),
        centerTitle: true,
        //automaticallyImplyLeading: false,
        title: const Text(
          'Favorilerim',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            //fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(0),
          child: ListView(
            children: [
              Wrap(
                children: favoriteItems
                    .map((_fav) => FavoriteItem(fav: _fav))
                    .toList(),
              ),
            ],
          )),
    );
  }
}
