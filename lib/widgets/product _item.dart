import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketapp/globalStates/basket.dart';
import 'package:marketapp/screens/productDetail.dart';

class ProductItem extends ConsumerStatefulWidget {
  const ProductItem({Key? key, required this.prd}) : super(key: key);
  final Map prd;
  ConsumerState createState() => _ProductItem();
}

class _ProductItem extends ConsumerState<ProductItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _height = 110.0;
    return Container(
      width: _height,
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetail(
                    prd: widget.prd,
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  width: _height - 10,
                  height: _height - 10,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        strokeAlign: BorderSide.strokeAlignOutside,
                        width: 1,
                        color: Colors.grey,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0))),
                  child: Image.asset(
                    widget.prd['img'], //list isn't null
                    height: _height - 20,
                    width: _height - 20,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: _height,
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.prd['price']),
                      Text(
                        widget.prd['name'],
                        style: const TextStyle(
                            fontSize: 12.0, color: Colors.black),
                      ),
                      Text(
                        widget.prd['property'],
                        style:
                            const TextStyle(fontSize: 9.0, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
            ),
            onPressed: () => ref
                .read(basketsProvider.notifier)
                .add(Basket(prdId: widget.prd['id'], total: "1")),
            child: Container(
              width: 25,
              //height: 25,*/
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: const Center(
                  child: Icon(
                Icons.add,
                color: Colors.blue,
              )),
            ),
          ),
        ),
      ]),
    );
  }
}
