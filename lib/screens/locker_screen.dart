import 'dart:io';
import 'package:armarios_inteligentes/screens/door.dart';
import 'package:armarios_inteligentes/screens/option_screen.dart';
import 'package:armarios_inteligentes/screens/report_screen.dart';
import 'package:armarios_inteligentes/screens/routines_screen.dart';
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
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Armário'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Modo de Operação: ",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Nível de Acesso: ",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(
            height: 15.0,
          ),
          SizedBox(
            child: Container(
              height: 35.0,
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Meus Compartimentos",
                style: TextStyle(
                    fontSize: 16.0,
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
              backgroundImage: AssetImage("images/door.png"),
            ),
            title: Text("Porta 01"),
            onTap: () async {
              final ConfirmAction action = await _asyncConfirmDialog(context);
              print("Confirmar $action");
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/door.png"),
            ),
            title: Text("Porta 02"),
            onTap: () async {
              final ConfirmAction action = await _asyncConfirmDialog(context);
              print("Confirmar $action");
            },
          ),
          SizedBox(
            child: Container(
              height: 35.0,
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Opções",
                style: TextStyle(
                    fontSize: 16.0,
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
            title: Text("Rotinas"),
            onTap: () {
             info();
              /*
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => RoutinesScreen()));*/
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/relatorio.jpg"),
            ),
            title: Text("Relatórios"),
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
            title: Text("Configurações"),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => OptionScreen()));
            },
          ),
        ],
      ),
    );
  }
}

enum ConfirmAction { CANCEL, ACCEPT }

Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Confirmar',
          textAlign: TextAlign.center,
        ),
        content: const Text(
          'Tem certeza que deseja abrir a porta ?',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text(
              'Sim',
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => DoorScreen()));
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

  Future timeStamp() async {
  final response = await http.get('http://armariosinteligentes.com/api/v3/timestamp');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    var jsonResponse = json.decode(response.body);
    tempoStamp tempo = new tempoStamp.fromJson(jsonResponse);
    String time = ('${tempo.timestamp}');
    return time;
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

  Mypost(String endereco, String deviceId, String clientId,   String clientSecret, var parametro1, var parametro2) async {
  var time = await timeStamp();
  String comando = "/dispositivo/" + deviceId + "/" + endereco + "?"
      + parametro1 + "=" + parametro2 + "&client_id=" + clientId +
      "&timestamp=" + time.toString();

  var key = utf8.encode(clientSecret);
  var bytes = utf8.encode(comando);
  var hmacSha256 = new Hmac(sha256, key); // HMAC-SHA256
  var assinatura = hmacSha256.convert(bytes).toString().toLowerCase();

    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, String> body = {
      parametro1: parametro2,
    };

    String url = "https://armariosinteligentes.com/api/v2" + comando +
        "&signature=" + assinatura;

    final response =
    await http.post(url,body: body,);
    final responseJson = json.decode(response.body);

    print(response.statusCode);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      print(responseJson);
    } else {
      print(responseJson);
    }
  }

Myget(String endereco, String deviceId,
    String clientId,   String clientSecret) async {

  var time = await timeStamp();

  String comando = "/dispositivo/" + deviceId + "/" + endereco + "?client_id="
      + clientId + "&timestamp=" + time.toString();


  var key = utf8.encode(clientSecret);
  var bytes = utf8.encode(comando);

  var hmacSha256 = new Hmac(sha256, key); // HMAC-SHA256
  var assinatura = hmacSha256.convert(bytes).toString();

  Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };


  String url = "https://armariosinteligentes.com/api/v2" + comando +
      "&signature=" + assinatura;

  final response =
  await http.post(url,headers: headers);
  final responseJson = json.decode(response.body);

  print(response.statusCode);

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    print(responseJson);
  } else {
    print(responseJson);
  }
}

info() async {
  return Myget ("info", "0C738F996163C4B625D11E971B3C4E18",
      "396b8f007f73124631105c1c81c4bd89",
      "7e2cc5ee9ee2021cb6752052fdfd8730");
}

reiniciar() async {
  return Mypost ("reiniciar", "0C738F996163C4B625D11E971B3C4E18",
      "396b8f007f73124631105c1c81c4bd89",
      "7e2cc5ee9ee2021cb6752052fdfd8730","","");
}