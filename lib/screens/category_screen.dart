import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CategoryScreen(this.snapshot);



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(snapshot.data["title"]),
              centerTitle: true,
            ),
          ),
          body: ListView(
            padding: EdgeInsets.all(20.0),
                children: <Widget>[
                  Text(
                    snapshot.data["titleprivacy"],
                    textAlign: TextAlign.justify,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.lightBlue),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    snapshot.data["textprivacy"],
                    textAlign: TextAlign.justify,
                    style:
                    TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    snapshot.data["titlesite"],
                    textAlign: TextAlign.justify,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.lightBlue),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    snapshot.data["textsite"],
                    textAlign: TextAlign.justify,
                    style:
                    TextStyle(fontSize: 15.0),
                  ),
                ]),
          ),
        );
  }
}
