import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketapp/globalStates/basket.dart';

class BasketItem extends ConsumerStatefulWidget {
  const BasketItem({Key? key, required this.prd}) : super(key: key);
  final Map prd;

  @override
  ConsumerState createState() => _BasketItem();
}

class _BasketItem extends ConsumerState<BasketItem> {
  @override
  void initState() {
    super.initState();
  }

  var adet = 0;

  Future getTotal() async {
    var t;
    var baskets = ref.watch(basketsProvider);
    baskets.forEach((e) {
      if (widget.prd['id'] == e.prdId) {
        t = int.parse(e.total);
      }
    });
    adet = t;
  }

  decrease() {
    ref.read(basketsProvider.notifier).decrease(prdId: widget.prd['id']);
  }

  increase() {
    ref.read(basketsProvider.notifier).increase(prdId: widget.prd['id']);
  }

  @override
  Widget build(BuildContext context) {
    //adet = getTotal();
    getTotal();
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: EdgeInsets.all(15),
          height: 100.0,
          width: MediaQuery.of(context).size.width - 30,
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Image.asset(
                  widget.prd['img'],
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
                          widget.prd['name'],
                          style: TextStyle(fontSize: 13.0, color: Colors.black),
                        ),
                        Text(
                          widget.prd['property'],
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                        Text(
                          widget.prd['price'],
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
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 20,
                        height: 25,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                            decrease();
                          },
                          child: const Center(
                              child: Icon(
                            Icons.remove,
                            color: Colors.blue,
                          )),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 25,
                        color: Colors.blue[400],
                        child: Center(
                          child: Text(
                            adet.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        width: 20,
                        height: 25,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                            increase();
                          },
                          child: const Center(
                              child: Icon(
                            Icons.add,
                            color: Colors.blue,
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
