import 'package:flutter/material.dart';
import 'package:marketapp/screens/products.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.cat}) : super(key: key);
  final Map cat;

  Widget build(BuildContext context) {
    var _height = 90.0;
    return Container(
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Products(category: cat['name'].toString())),
              );
            },
            child: Stack(children: <Widget>[
              Stack(children: [
                Image.asset(
                  cat['img'], //list isn't null
                  height: _height,
                  width: _height,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: _height,
                  width: _height,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromARGB(90, 136, 168, 248),
                      Color.fromARGB(108, 44, 88, 158),
                    ],
                  )),
                ),
              ]),
              Container(
                height: _height,
                width: _height,
                padding: const EdgeInsets.all(1),
                constraints: const BoxConstraints(
                  minHeight: 20,
                  minWidth: 20,
                ),
                child: Center(
                  child: Text(
                    cat["name"], //list isn't null
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
