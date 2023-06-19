import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketapp/files/ordersFile.dart';
import 'package:marketapp/globalStates/favorites.dart';
import 'package:marketapp/sqflite/sql_favorites.dart';
import 'package:marketapp/util/api.dart';
import 'package:http/http.dart' as http;

class FileDebug extends ConsumerStatefulWidget {
  const FileDebug({Key? key}) : super(key: key);
  @override
  ConsumerState<FileDebug> createState() => _FileDebug();
}

class _FileDebug extends ConsumerState<FileDebug> {
  late Future<Product> futureAlbum;
  late Future<List<Favorite>> sql;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();

    SqlFavorite fav = new SqlFavorite();
    sql = fav.favorites();
  }

  var file;
  var value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 192, 127),
      appBar: AppBar(
        backgroundColor: Color(0xFF5AA9E6),
        centerTitle: true,
        //automaticallyImplyLeading: false,
        title: const Text(
          'debug',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            //fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      body: Container(
        child: Column(children: [
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(11),
              child: ListView(children: [
                ElevatedButton(
                  onPressed: () => setState(() {
                    value = 2;
                  }),
                  child: Text('File Test'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() {
                    value = 1;
                  }),
                  child: Text('Api Test'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() {
                    value = 3;
                  }),
                  child: Text('Sql Test'),
                ),
              ]),
            ),
          ),
          Flexible(
              flex: 1,
              child: Container(
                color: Colors.amber[100],
                child: Center(
                  child: Output(context),
                ),
              )),
        ]),
      ),
    );
  }

  Output(BuildContext context) {
    switch (value) {
      case 1:
        return FutureBuilder<Product>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.id.toString() +
                  " \n\n" +
                  snapshot.data!.title +
                  " \n\n" +
                  snapshot.data!.category +
                  " \n\n" +
                  snapshot.data!.description +
                  " \n\n" +
                  snapshot.data!.image +
                  " \n\n" +
                  snapshot.data!.price.toString());
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        );

      case 2:
        {
          var val = 0;
          FileUtils.readFromFile().then((v) => v != null
              ? setState(() {
                  file = v;
                })
              : setState(
                  () {
                    file = 'kayıt yok';
                  },
                ));
          return Text(file.toString());
        }

      case 3:
        return FutureBuilder<List<Favorite>>(
          future: sql,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text("database:\n" +
                  snapshot.data!.map((e) => e.prdId).toString());
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        );

      default:
        Text('debug console');
    }
  }
}

/*case 1:
        gethttp();
        return Text(res.toString());*/
