import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              height: 20,
            ),
            Container(
              height: 300,
              width: 300,
              child: Image.asset(
                "images/box2.png",
                width: 400,
                height: 400,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
              child: RaisedButton(
                color: Colors.lightBlueAccent,
                textColor: Colors.white,
                splashColor: Colors.lightBlueAccent,
                onPressed: () {
                  scan();
                },
                // scan,
                child: const Text('Escanear o QR Code.'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                _barcode,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
      setState(() => this._barcode =
          'nulo, o usuário clicou em voltar antes de escanear algo');
    } catch (e) {
      setState(() => this._barcode = 'Erro desconhecido : $e');
    }
  }
}
