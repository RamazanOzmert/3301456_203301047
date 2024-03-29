import 'package:flutter/material.dart';

import 'package:marketapp/util/campaigns.dart';
import 'package:marketapp/widgets/campaign_item.dart';
import 'package:marketapp/widgets/logo_bar.dart';

class Declaration extends StatelessWidget {
  const Declaration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5AA9E6),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Kampanyalar',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            //fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            //button: 'add campaign'
            Card(
              elevation: 2,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 40,
                      margin: EdgeInsets.only(right: 15),
                      child: ElevatedButton(
                        onPressed: () => buildDialog(context),
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            fixedSize: Size.zero,
                            foregroundColor: Colors.blue[300],
                            backgroundColor: Colors.white),
                        child: Icon(Icons.add),
                      ),
                    ),
                    Text(
                      "Kampanya Kodu Ekle",
                      style: TextStyle(
                        color: Theme.of(context).canvasColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Wrap(
              children: campaigns
                  .map((cam) => CampaignItem(
                        campaign: cam,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  buildDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: buildSearchInput(context),
        actions: <Widget>[
          Container(
              width: 600,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[400]),
                      onPressed: () => Navigator.pop(context, 'Kapat'),
                      child: const Text('Kapat'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context, 'Kaydet'),
                      child: const Text('Kaydet'),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  buildSearchInput(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 60,
      child: TextFormField(
        cursorHeight: 24,
        decoration: InputDecoration(
            fillColor: Colors.white,
            iconColor: Theme.of(context).canvasColor,
            hintText: 'Kampanya Kodunu Girin'),
      ),
    );
  }
}
