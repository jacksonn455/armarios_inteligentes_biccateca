import 'package:armarios_inteligentes/screens/qr_screen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';


class QrScan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QrScanState();
  }
}

class QrScanState extends State<QrScan> {
  String _barcode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Leitor de QR Code'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Container(
              height: 340,
              width: 340,
              child: FlareActor("assets/Locker3.flr", animation: "scan",),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 5.0),
              child:                           SizedBox(
                height: 30,
                width: 200,
                child: new RaisedButton(
                    color: Colors.lightBlueAccent,
                    child: Text(
                      "Escanear",
                      style: TextStyle(
                        fontSize: 15.0, color: Colors.white
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  LiveBarcodeScanner())
                      );
                    },
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Text(
                _barcode,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
/*
  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this._barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this._barcode = 'O usuário não deu perimissão para usar a camera!';
        });
      } else {
        setState(() => this._barcode = 'Erro desconhecido $e');
      }
    } on FormatException {
      setState(() =>
      this._barcode =
      'nulo, o usuário clicou em voltar antes de escanear algo');
    } catch (e) {
      setState(() => this._barcode = 'Erro desconhecido : $e');
    }
  }*/
}
