import 'package:armarios_inteligentes/screens/locker_screen.dart';
import 'package:armarios_inteligentes/screens/report_oc_screen.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Relatórios'),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => LockerScreen())),
        ),
      ),
    body: Stack(
    children: <Widget>[
    Image.asset(
      "images/wall5.png",
      fit: BoxFit.cover,
      height: 1000,
    ), ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/relatorio.jpg"),
            ),
            title: Text("Relatório de Ocupação"),
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) => ReportOcScreen()));
            },
          ),
          Divider(),
        ],
      ),
    ]));
  }
}
