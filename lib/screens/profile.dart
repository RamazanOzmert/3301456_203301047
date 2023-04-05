import 'package:flutter/material.dart';
import 'package:marketapp/screens/usrprofile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  var tra_icon = Icon(
    Icons.chevron_right_rounded,
    color: Colors.blue,
  );
  @override
  Widget build(BuildContext context) {
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
          Card(
            elevation: 2,
            margin: EdgeInsets.zero,
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Giriş yap'),
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
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero)),
            elevation: 2,
            margin: EdgeInsets.zero,
            color: Colors.white,
            child: Container(
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero)),
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('adreslerim'),
                      onTap: () {},
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
                      leading: Icon(Icons.star),
                      title: Text('Favoriler'),
                      onTap: () {},
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
                  child: ListTile(
                      leading: Icon(Icons.language),
                      title: Text('Türkçe'),
                      onTap: () {},
                      trailing: tra_icon),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 5),
                    child: Text('Versiyon')),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero)),
                  margin: EdgeInsets.zero,
                  color: Colors.white,
                  child: ListTile(
                    title: Text('1.0.0'),
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
