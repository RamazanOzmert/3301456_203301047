import 'package:flutter/material.dart';
import 'package:marketapp/debug/fileDebug_screen.dart';
import 'package:marketapp/screens/languages.dart';
import 'package:marketapp/screens/profil_address.dart';
import 'package:marketapp/screens/usr_favorites.dart';
import 'package:marketapp/screens/usr_orders.dart';
import 'package:marketapp/screens/usr_profile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var tra_icon = const Icon(
      Icons.chevron_right_rounded,
      color: Colors.blue,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF5AA9E6),
        automaticallyImplyLeading: false,
        title: Text(
          'Profil',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Wrap(runSpacing: 15, children: [
          //giriş yap
          Card(
            elevation: 2,
            margin: EdgeInsets.zero,
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Profilim'),
              selectedTileColor: Colors.orange[100],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UsrProfile(),
                  ),
                );
              },
              trailing: tra_icon,
            ),
          ),
          //ekler
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero)),
            elevation: 2,
            margin: EdgeInsets.zero,
            color: Colors.white,
            child: Container(
              child: Column(
                children: [
                  //adresler
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero)),
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('adreslerim'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileAddress(),
                          ),
                        );
                      },
                      trailing: tra_icon,
                    ),
                  ),
                  //favoriler
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero)),
                    margin: EdgeInsets.zero,
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(Icons.star),
                      title: Text('Favoriler'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserFavorites(),
                          ),
                        );
                      },
                      trailing: tra_icon,
                    ),
                  ),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero)),
                    margin: EdgeInsets.zero,
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(Icons.shopping_basket_rounded),
                      title: Text('Siparişlerim'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserOrders(),
                          ),
                        );
                      },
                      trailing: tra_icon,
                    ),
                  ),

                  //yardım
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero)),
                    margin: EdgeInsets.zero,
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(Icons.help),
                      title: Text('Yardım'),
                      onTap: () {},
                      trailing: tra_icon,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Dİl
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 5),
                    child: Text('Dil / language')),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero)),
                  margin: EdgeInsets.zero,
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Languages(),
                        ),
                      );
                    },
                    child: ListTile(
                        leading: Icon(Icons.language),
                        title: Text('Türkçe'),
                        trailing: tra_icon),
                  ),
                ),
              ],
            ),
          ),
          //versiyon
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 5),
                    child: Text('Versiyon')),
                GestureDetector(
                  onLongPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FileDebug(),
                      ),
                    );
                  },
                  child: const Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero)),
                    margin: EdgeInsets.zero,
                    color: Colors.white,
                    child: ListTile(
                      title: Text('1.0.0'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
