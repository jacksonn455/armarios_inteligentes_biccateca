import 'package:armarios_inteligentes/models/user_model.dart';
import 'package:armarios_inteligentes/screens/qrscan_screen.dart';
import 'package:armarios_inteligentes/tiles/locker_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String uid = UserModel.of(context).firebaseUser.uid;
    return Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.lightBlueAccent,
              elevation: 0.0,
              actions: <Widget>[
                IconButton(
                  disabledColor: Colors.white,
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QrScan()));
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Armários Inteligentes"),
                centerTitle: true,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(top: 55),
          child: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance.collection("lockers").where("userid", isEqualTo: "$uid").getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else {
                var dividedTiles = ListTile.divideTiles(
                        tiles: snapshot.data.documents.map((doc) {
                          return LockerTile(doc);
                        }).toList(),
                        color: Colors.grey)
                    .toList();
                return ListView(
                  children: dividedTiles,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

