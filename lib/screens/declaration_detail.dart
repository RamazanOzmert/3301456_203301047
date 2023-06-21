import 'package:flutter/material.dart';

class DeclarationDetail extends StatefulWidget {
  const DeclarationDetail({Key? key, this.campaign}) : super(key: key);
  final Map? campaign;
  @override
  _DeclarationDetail createState() => _DeclarationDetail();
}

class _DeclarationDetail extends State<DeclarationDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF5AA9E6),
          title: const Text(
            'Kampanya Detay',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        body: Card(
          elevation: 1,
          child: Container(
              padding: EdgeInsets.all(15.0),
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      bottom: 10,
                    ),
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            widget.campaign!['img'],
                            height: 150,
                            width: 400,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          widget.campaign!['title'],
                          style: TextStyle(
                            color: Theme.of(context).canvasColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: 350),
                        child: Text(
                          widget.campaign!['conditions'],
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ));
  }
}
