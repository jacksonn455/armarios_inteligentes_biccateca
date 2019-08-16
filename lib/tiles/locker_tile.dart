import 'package:armarios_inteligentes/screens/locker_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class LockerTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  LockerTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("ARMARIO_0000" + snapshot.data["id_armario"], textAlign: TextAlign.justify,),

      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>LockerScreen())
        );
      },
    );
  }
}
