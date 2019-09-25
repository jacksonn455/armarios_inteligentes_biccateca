import 'package:armarios_inteligentes/screens/locker_screen.dart';
import 'package:armarios_inteligentes/screens/qrcode_screen.dart';
import 'package:armarios_inteligentes/screens/routines_screen.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class OptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Configurações'),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LockerScreen())),
        ),
      ),
      body: Stack(
        children: <Widget>[
      Image.asset(
      "images/wall5.png",
        fit: BoxFit.cover,
        height: 1000,
      ),
      ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/update3.png"),
            ),
            title: Text("Atualizar Dispositivo"),
            onTap: () async {
              final ConfirmAction action = await _atualizar(context);
              print("Confirmar $action");
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/update4.png"),
            ),
            title: Text("Reiniciar Dispositivo"),
            onTap: () async {
              final ConfirmAction action = await _reiniciar(context);
              print("Confirmar $action");
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/modulos1.jpg"),
            ),
            title: Text("Reconfigurar Módulos"),
            onTap: () async {
              final ConfirmAction action = await _reconfig(context);
              print("Confirmar $action");
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/padrao.jpg"),
            ),
            title: Text("Padrão de Fábrica"),
            onTap: () async {
              final ConfirmAction action = await _asyncConfirmDialog(context);
              print("Confirmar $action");
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/qrcode1.png"),
            ),
            title: Text("QR Code"),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => QrScreen()));
            },
          ),
          Divider(),
        ],
      ),
    ]));
  }
}

enum ConfirmAction { CANCEL, ACCEPT }

Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  Alert(
    context: context,
    type: AlertType.warning,
    title: "Tem certeza que deseja dar padrão de fábrica ?",
    buttons: [
      DialogButton(
        child: Text(
          "Sim",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () async{
          consumo.padraoDeFabrica();
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

Future<ConfirmAction> _reiniciar(BuildContext context) async {
  Alert(
    context: context,
    type: AlertType.warning,
    title: "Tem certeza que deseja reiniciar ?",
    buttons: [
      DialogButton(
        child: Text(
          "Sim",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () async{
          consumo.reiniciar();
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

Future<ConfirmAction> _reconfig(BuildContext context) async {
  Alert(
    context: context,
    type: AlertType.warning,
    title: "Tem certeza que deseja reconfigurar os módulos ?",
    buttons: [
      DialogButton(
        child: Text(
          "Sim",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () async{
          consumo.reconfigurar();
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

Future<ConfirmAction> _atualizar(BuildContext context) async {
  Alert(
    context: context,
    type: AlertType.warning,
    title: "Tem certeza que deseja atualizar ?",
    buttons: [
      DialogButton(
        child: Text(
          "Sim",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () async{
          consumo.atualizar();
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

Future teste() {
  var testando = consumo.recebMsg();
  return testando;
}
