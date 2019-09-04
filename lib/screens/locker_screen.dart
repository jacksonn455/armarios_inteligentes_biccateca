import 'dart:io';
import 'package:armarios_inteligentes/screens/about_screen.dart';
import 'package:armarios_inteligentes/screens/door.dart';
import 'package:armarios_inteligentes/screens/option_screen.dart';
import 'package:armarios_inteligentes/screens/report_screen.dart';
import 'package:armarios_inteligentes/screens/routines_screen.dart';
import 'package:armarios_inteligentes/widgets/request.dart';
import 'package:armarios_inteligentes/widgets/tempoStamp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LockerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LockerScreenState();
  }
}

class LockerScreenState extends State<LockerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('ARMARIO_000079'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        children: <Widget>[
         ListTile(
            title: Text(
              "Modo de Operação:",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            trailing: Text(
              "Guarda Volumes",
              style: TextStyle(fontSize: 13.0, color: Colors.lightBlueAccent),
            ),
            dense: true,
          ),
          ListTile(
            title: Text(
              "Tipo de Acesso:",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            trailing: Text(
              "Privado",
              style: TextStyle(fontSize: 13.0, color: Colors.lightBlueAccent),
            ),
            dense: true,
          ),
          ListTile(
            title: Text(
              "Nivel de Acesso:",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            trailing: Text(
              "Gerente",
              style: TextStyle(fontSize: 13.0, color: Colors.lightBlueAccent),
            ),
            dense: true,
          ),
          SizedBox(
            child: Container(
              height: 25.0,
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Meus Compartimentos",
                style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              color: Colors.lightBlueAccent,
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/door1.png"),
            ),
            title: Text(
              "Porta 01",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () async {
              final ConfirmAction action = await _asyncPortaUm(context);
              print("Confirmar $action");
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/door1.png"),
            ),
            title: Text(
              "Porta 02",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () async {
              final ConfirmAction action = await _asyncPortaDois(context);
              print("Confirmar $action");
            },
          ),
          SizedBox(
            child: Container(
              height: 25.0,
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Opções",
                style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              color: Colors.lightBlueAccent,
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/rotinas2.png"),
            ),
            title: Text(
              "Rotinas",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => RoutinesScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/relatorio.jpg"),
            ),
            title: Text(
              "Relatórios",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ReportScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/configure.jpg"),
            ),
            title: Text(
              "Configurações",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => OptionScreen()));
            },
          ),
          SizedBox(
            child: Container(
              height: 25.0,
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Informações",
                style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              color: Colors.lightBlueAccent,
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/about.jpg"),
            ),
            title: Text(
              "Sobre",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AboutScreen()));
            },
          ),
        ],
      ),
    );
  }
}

enum ConfirmAction { CANCEL, ACCEPT }

// ignore: missing_return
Future<ConfirmAction> _asyncPortaUm(BuildContext context) async {
  Alert(
    context: context,
    type: AlertType.warning,
    title: "Tem certeza que deseja abrir a porta 1 ?",
    buttons: [
      DialogButton(
        child: Text(
          "Sim",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () async{
          consumo.abrirportaUm();
          await Future.delayed(Duration(seconds: 3));
          await Confirmacao(context);
        },
        color: Colors.lightBlueAccent,
      ),
      DialogButton(
        child: Text(
          "Não",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        color: Colors.lightBlueAccent,
      )
    ],
  ).show();
}

// ignore: missing_return
Future<ConfirmAction> _asyncPortaDois(BuildContext context) async {
  Alert(
    context: context,
    type: AlertType.warning,
    title: "Tem certeza que deseja abrir a porta 2 ?",
    buttons: [
      DialogButton(
        child: Text(
          "Sim",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () async{
          consumo.abrirportaDois();
          await Future.delayed(Duration(seconds: 3));
          await Confirmacao(context);
        },
        color: Colors.lightBlueAccent,
      ),
      DialogButton(
        child: Text(
          "Não",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        color: Colors.lightBlueAccent,
      )
    ],
  ).show();
}

Future Confirmacao(BuildContext context) async {
  Alert(
    context: context,
    type: AlertType.info,
    title: await teste(),
    buttons: [
      DialogButton(
        child: Text(
          "OK",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        color: Colors.lightBlueAccent,
        width: 120,
      )
    ],
  ).show();
}

Future teste(){
 var testando = consumo.recebMsg();
  return testando;
}

