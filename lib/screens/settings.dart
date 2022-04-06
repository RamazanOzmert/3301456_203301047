import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Settings',),
        backgroundColor: Colors.red,
      ),
      body: Container(
              child: Container(
                padding: EdgeInsets.all(8),
                child: ListView(
                  children: [
                    Container(
                      height: 40,
                      child:Row(children: [
                        Text("Genel",
                          style: TextStyle(
                            color:Colors.pink,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],),
                    ),
                    Container(
                      height: 40,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("En üste yeni geörev ekle",),
                        Icon(Icons.check_circle_outline),
                      ],),
                    ),
                    Container(
                      height: 40,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("En üste yeni geörev ekle",),
                          Icon(Icons.check_circle_outline),
                        ],),
                    ),
                    Container(
                      height: 40,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("En üste yeni geörev ekle",),
                          Icon(Icons.check_circle_outline),
                        ],),
                    ),
                    Container(
                      height: 40,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("En üste yeni geörev ekle",),
                          Icon(Icons.check_circle_outline),
                        ],),
                    ),
                    const Divider(
                      height: 20,
                      thickness: 0,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.black,
                    ),
                    Container(
                      height: 40,
                      child:Row(children: [
                        Text("Bildirimler",
                          style: TextStyle(
                            color:Colors.pink,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],),
                    ),
                    Container(
                      height: 40,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("En üste yeni geörev ekle",),
                          Icon(Icons.check_circle_outline),
                        ],),
                    ),
                    Container(
                      height: 40,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("En üste yeni geörev ekle",),
                          Icon(Icons.check_circle_outline),
                        ],),
                    ),
                    Container(
                      height: 40,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("En üste yeni geörev ekle",),
                          Icon(Icons.check_circle_outline),
                        ],),
                    ),
                    Container(
                      height: 40,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("En üste yeni geörev ekle",),
                          Icon(Icons.check_circle_outline),
                        ],),
                    ),
                    const Divider(
                      height: 20,
                      thickness: 0,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.black,
                    ),
                    Container(
                      height: 40,
                      child:Row(children: [
                        Text("Yardım Ve Geri Bildirim",
                          style: TextStyle(
                            color:Colors.pink,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],),
                    ),
                    Container(
                      height: 40,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("En üste yeni geörev ekle",),
                          Icon(Icons.check_circle_outline),
                        ],),
                    ),
                    Container(
                      height: 40,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("En üste yeni geörev ekle",),
                          Icon(Icons.check_circle_outline),
                        ],),
                    ),
                    Container(
                      height: 40,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("En üste yeni geörev ekle",),
                          Icon(Icons.check_circle_outline),
                        ],),
                    ),
                    Container(
                      height: 40,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("En üste yeni geörev ekle",),
                          Icon(Icons.check_circle_outline),
                        ],),
                    ),

                  ],
                ),
              ),
    ),
    );
  }
}
