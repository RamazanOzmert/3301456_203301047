import 'package:flutter/material.dart';

import 'package:marketapp/screens/usrLogin.dart';
import 'package:marketapp/screens/usrRegister.dart';
import 'package:marketapp/widgets/logoBar.dart';
import 'package:marketapp/widgets/main_screeen.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoBar(),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width,
              //color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Favori alışveriş',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 26,
                      ),
                    ),
                    Text(
                      'uygulamanıza hoş geldiniz',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 26,
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
              flex: 5,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //margin: EdgeInsets.all(50.0),
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(150.0),
                        child: Image.asset(
                          'assets/images/firstPage.jpg',
                          width: 250,
                          height: 250,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ])),
          Expanded(
            flex: 3,
            child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MainScreen()));
                          /*Navigator.push(
                              context,

                              /*MaterialPageRoute(
                              builder: (context) => NavBar(),
                            ),*/

                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        NavBar(),
                              ));*/
                        },
                        child: Text(
                          'Üye olmadan devam et',
                          style: TextStyle(color: Colors.grey),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(12),
                            fixedSize: Size.fromWidth(
                                MediaQuery.of(context).size.width / 1.5)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserRegister()));
                        },
                        child: Text(
                          'Üye ol',
                          style: TextStyle(fontSize: 18),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hesabınız var mı?',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserLogin(),
                                ),
                              );
                            },
                            child: Text('Giriş')),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
