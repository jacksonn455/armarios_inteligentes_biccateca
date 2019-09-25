import 'package:armarios_inteligentes/models/user_model.dart';
import 'package:armarios_inteligentes/screens/locker_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class LockerTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  LockerTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(snapshot.data["numero_serie"], textAlign: TextAlign.justify, style: TextStyle(fontSize: 13.0),),
      subtitle: Text('Guarda Volume'),
      trailing: Column(
        children: <Widget>[
          Icon(Icons.keyboard_arrow_right),
          Text("Gerenciar", style: TextStyle(color: Colors.lightBlueAccent),),
        ],
      ),
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>LockerScreen())
        );
      },
    );
  }

}

