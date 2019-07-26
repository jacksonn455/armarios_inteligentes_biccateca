import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  PlaceTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 135.0,
            child: Image.network(
              snapshot.data["image"],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  snapshot.data["title"],
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Text(
                  snapshot.data["address"],
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  snapshot.data["city"],
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey[500], fontSize: 15.0),
                ),
                Text(
                  snapshot.data["cep"],
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  snapshot.data["contact"],
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15.0),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Ver no Mapa"),
                textColor: Colors.lightBlueAccent,
                padding: EdgeInsets.zero,
                onPressed: () {
                  launch(
                      "https://www.google.com/maps/search/?api=1&query=${snapshot.data["lat"]},"
                      "${snapshot.data["long"]}");
                },
              ),
              FlatButton(
                child: Text("Ligar"),
                textColor: Colors.lightBlueAccent,
                padding: EdgeInsets.zero,
                onPressed: () {
                  launch("tel:${snapshot.data["phone"]}");
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
