import 'dart:io';
import 'package:armarios_inteligentes/screens/about_screen.dart';
import 'package:armarios_inteligentes/screens/door.dart';
import 'package:armarios_inteligentes/screens/option_screen.dart';
import 'package:armarios_inteligentes/screens/report_screen.dart';
import 'package:armarios_inteligentes/screens/routines_screen.dart';
import 'package:armarios_inteligentes/widgets/request.dart';
import 'package:armarios_inteligentes/widgets/tempoStamp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';

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

Future<ConfirmAction> _asyncPortaUm(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Confirmar',
          textAlign: TextAlign.justify,
        ),
        content: const Text(
          'Tem certeza que deseja abrir a porta 1 ?',
          textAlign: TextAlign.justify,
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text(
              'Sim',
              textAlign: TextAlign.justify,
            ),
            onPressed: () async{
              consumo.abrirportaUm();
              await Future.delayed(Duration(seconds: 3));
              await Confirmacao(context);
            },
          ),
          FlatButton(
            child: const Text(
              'Não',
              textAlign: TextAlign.justify,
            ),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
        ],
      );
    },
  );
}

Future<ConfirmAction> _asyncPortaDois(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Confirmar',
          textAlign: TextAlign.justify,
        ),
        content: Text(
          'Tem certeza que deseja abrir a porta 2 ?',
          textAlign: TextAlign.justify,
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text(
              'Sim',
              textAlign: TextAlign.justify,
            ),
            onPressed: () async {
              consumo.abrirportaDois();
              await Future.delayed(Duration(seconds: 3));
              await Confirmacao(context);
            },
          ),
          FlatButton(
            child: const Text(
              'Não',
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
        ],
      );
    },
  );
}

Future Confirmacao(BuildContext context) async {
  // configura o button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text(await teste()),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

Future teste(){
 var testando = consumo.recebMsg();
  return testando;
}

