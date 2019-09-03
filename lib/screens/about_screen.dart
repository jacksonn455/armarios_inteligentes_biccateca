import 'package:armarios_inteligentes/screens/locker_screen.dart';
import 'package:armarios_inteligentes/screens/report_screen.dart';
import 'package:armarios_inteligentes/screens/routines_screen.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Sobre'),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LockerScreen())),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/portas.jpg"),
            ),
            title: Text(
              "Número de portas",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () async {
              consumo.numeroDePortas();
              await Future.delayed(Duration(seconds: 3));
              await Confirmacao(context);
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/door2.png"),
            ),
            title: Text(
              "Portas abertas",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () async {
              consumo.portasAbertas();
              await Future.delayed(Duration(seconds: 3));
             await ConfirmacaoUm(context);
            }
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/compartimento.jpg"),
            ),
            title: Text(
              "Compartimentos",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () async {
              consumo.compartimentos();
              await Future.delayed(Duration(seconds: 3));
              await ConfirmacaoUm(context);
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/version.jpg"),
            ),
            title: Text(
              "Versão do software",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () async {
              consumo.versao();
              await Future.delayed(Duration(seconds: 3));
              await Confirmacao(context);
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/wifi.jpg"),
            ),
            title: Text(
              "Rede wifi",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () async {
              consumo.wifi();
              await Future.delayed(Duration(seconds: 3));
              await Confirmacao(context);
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/wifi3.png"),
            ),
            title: Text(
              "Qualidade do sinal wifi",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () async {
              consumo.rssi();
              await Future.delayed(Duration(seconds: 3));
              await Confirmacao(context);
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/mac.jpg"),
            ),
            title: Text(
              "Endereço Físico",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () async {
              consumo.mac();
              await Future.delayed(Duration(seconds: 1));
              await Confirmacao(context);
            },
          ),
        ],
      ),
    );
  }
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

Future ConfirmacaoUm(BuildContext context) async {
  Alert(
    context: context,
    type: AlertType.info,
    title: await testeUm(),
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

Future testeUm()async{
  List lista = await consumo.recebMsgLista();
  String teste =  lista.toString();
    if (teste == '[]') {
      teste = "Nenhuma porta esta aberta";
      return teste;
    } else {
      teste = teste.substring(1, teste.length -1);
      teste = teste.replaceFirst(",", "");
      return teste;
    }
  }