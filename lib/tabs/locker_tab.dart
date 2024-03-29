import 'package:armarios_inteligentes/models/user_model.dart';
import 'package:armarios_inteligentes/tiles/locker_tile.dart';
import 'package:armarios_inteligentes/tiles/place_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class PlacesTab extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    String uid = UserModel.of(context).firebaseUser.uid;
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("lockers").where("userid", isEqualTo: "$uid").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else
          return ListView(
            children: snapshot.data.documents.map((doc) => LockerTile(doc))
                .toList(),
          );
      },
    );
  }
}
