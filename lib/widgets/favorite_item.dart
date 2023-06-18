import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketapp/globalStates/favorites.dart';
import 'package:marketapp/screens/product_detail.dart';

class FavoriteItem extends ConsumerStatefulWidget {
  const FavoriteItem({Key? key, required this.fav}) : super(key: key);
  final Map fav;

  @override
  ConsumerState createState() => _FavoriteItem();
}

class _FavoriteItem extends ConsumerState<FavoriteItem> {
  @override
  void initState() {
    super.initState();
  }

  updateFavorite() {
    ref.read(favoriteProvider.notifier).update(
          Favorite(prdId: widget.fav['id']),
        );
    getFav();
  }

  var isFav;
  getFav() {
    var favPrd = ref.watch(favoriteProvider);
    isFav = favPrd.any((element) => element.prdId == widget.fav['id']);
  }

  @override
  Widget build(BuildContext context) {
    var favPrd = ref.watch(favoriteProvider);

    getFav();
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(
              prd: widget.fav,
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            padding: EdgeInsets.all(15),
            height: 105.0,
            width: MediaQuery.of(context).size.width - 30,
            decoration: const BoxDecoration(
                color: Colors.white,
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 1))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Image.asset(
                    widget.fav['img'],
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Container(
                      height: 60,
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.fav['name'],
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.black),
                          ),
                          Text(
                            widget.fav['property'],
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                          Text(
                            widget.fav['price'],
                            style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ],
                      )),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: IconButton(
                          onPressed: () {
                            updateFavorite();
                          },
                          icon: const Icon(
                            color: Colors.amber,
                            size: 30,
                            Icons.star,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
