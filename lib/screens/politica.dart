import 'package:armarios_inteligentes/screens/category_screen.dart';
import 'package:flutter/material.dart';

class PoliticaScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
      ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/privacidade.png"),
            ),
            title: Text("Política de privacidade"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>CategoryScreen()));
            },
          ),
          Divider(),
        ],
      ),
    ]);
  }
}
