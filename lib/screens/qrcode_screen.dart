import 'package:armarios_inteligentes/models/user_model.dart';
import 'package:armarios_inteligentes/screens/NewLogin_screen.dart';
import 'package:armarios_inteligentes/screens/locker_screen.dart';
import 'package:armarios_inteligentes/screens/option_screen.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'home_screen.dart';
import 'package:mysql1/mysql1.dart';

class QrScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QrScreenState();
  }
}

class QrScreenState extends State<QrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('QR Code'),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => OptionScreen())),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20.0,),
            Container(
              padding: EdgeInsets.all(30.0),
              height: 400,
              width: 300,
              child: QrImage(
                data: 'https://armariosinteligentes.com/armario.php?id=4FE1BB42796620A3DF5CEB1FEE0EFAA2',
                version: QrVersions.auto,
                size: 320,
                gapless: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
