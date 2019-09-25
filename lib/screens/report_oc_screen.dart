import 'package:armarios_inteligentes/screens/locker_screen.dart';
import 'package:armarios_inteligentes/screens/report_screen.dart';
import 'package:flutter/material.dart';

class ReportOcScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Relatório de Ocupação'),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => ReportScreen())),
        ),
      ),
      body: Stack(
        children: <Widget>[
      Image.asset(
      "images/wall5.png",
        fit: BoxFit.cover,
        height: 1000,
      ),
    ]));
  }
}
