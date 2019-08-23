import 'package:armarios_inteligentes/widgets/request.dart';
import 'package:flutter/material.dart';

request consumo = new request();

class RoutinesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Rotinas'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/ocupacao.png"),
            ),
            title: Text("Ocupação"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/user.png"),
            ),
            title: Text("Usuários"),
            onTap: () {},
          ),
          SizedBox(
            child: Container(
              height: 35.0,
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Avançado",
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
              backgroundImage: AssetImage("images/porta.png"),
            ),
            title: Text("Abrir Todas as Portas"),
              onTap: () async {
                final ConfirmAction action = await _asyncConfirmDialog(context);
                print("Confirmar $action");
              },
          ),
          Divider(),
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
        content: const Text('Tem certeza que deseja abrir todas as portas ?', textAlign: TextAlign.center,),
        actions: <Widget>[
          FlatButton(
            child: const Text('Sim',textAlign: TextAlign.center,),
            onPressed: () {
            consumo.abrirTodasAsPortas();
            Navigator.of(context).pop(ConfirmAction.CANCEL);
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
