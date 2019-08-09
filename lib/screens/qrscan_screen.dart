import 'package:armarios_inteligentes/models/user_model.dart';
import 'package:armarios_inteligentes/screens/NewLogin_screen.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoped_model/scoped_model.dart';
import 'home_screen.dart';

class QrScan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QrScanState();
  }
}

class QrScanState extends State<QrScan> {
  String _status = "";
  String error = "";
  String nome="";

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
            Container(
              height: 350,
              width: 300,
              child: FlareActor(
                "assets/Locker4.flr",
                animation: "scan",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
              child: RaisedButton(
                onPressed: () {
                  if (UserModel.of(context).isLoggedIn()) {
                    scan();
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NewLoginScreen()));
                  }
                },
                child: Text(
                  UserModel.of(context).isLoggedIn()
                      ? "Escanear"
                      : "Fazer Autenticação",
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.lightBlueAccent,
                textColor: Colors.white,
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 10),
            ),
            ScopedModelDescendant<UserModel>(
              builder: (context, child, model) {
                nome ="${!model.isLoggedIn() ? "" : model.userData["name"]}";
                if(error == "")
                  nome = "";
                return Container(
                  child: Text(nome + error,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.red),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void SalvarMensagem() async {
    this._status = _status;
    if(_status != _status) // testar
    await Firestore.instance
        .collection("lockers")
        .document()
        .setData({"QR Code": _status});
  }

  void telaInicial() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => _status = barcode);
      SalvarMensagem();
      telaInicial();
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          error = ', você não deu perimissão para usar a camera!';
        });
      } else {
        setState(() => error = ', aconteceu um erro desconhecido $e');
      }
    } on FormatException {
      setState(() => error = ', você clicou em voltar antes de escanear algo');
    } catch (e) {
      setState(() => error = ' aconteceu erro desconhecido : $e');
    }
  }
}
