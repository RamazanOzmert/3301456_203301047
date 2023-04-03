import 'package:flutter/material.dart';

class CampaignItem extends StatelessWidget {
  final Map? campaign;
  CampaignItem({this.campaign});

  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
          padding: EdgeInsets.all(15.0),
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  campaign!['img'],
                  height: 150,
                  width: 400,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                campaign!['title'],
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 280),
                    child: Text(campaign!['conditions']),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          foregroundColor: Colors.blue[300],
                          backgroundColor: Colors.white),
                      child: Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
