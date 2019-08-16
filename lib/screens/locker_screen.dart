import 'package:armarios_inteligentes/screens/door.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LockerScreen()));
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
                  MaterialPageRoute(builder: (context) => LockerScreen()));
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
                  MaterialPageRoute(builder: (context) => LockerScreen()));
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
        title: Text('Confirmar',textAlign: TextAlign.center,),
        content: const Text('Tem certeza que deseja abrir a porta ?', textAlign: TextAlign.center,),
        actions: <Widget>[
          FlatButton(
            child: const Text('Sim',textAlign: TextAlign.center,),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => DoorScreen()));
            },
          ),
          FlatButton(
            child: const Text('Não',textAlign: TextAlign.center,),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
        ],
      );
    },
  );
}
