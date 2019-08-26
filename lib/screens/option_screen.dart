import 'package:armarios_inteligentes/screens/locker_screen.dart';
import 'package:armarios_inteligentes/screens/qrcode_screen.dart';
import 'package:armarios_inteligentes/screens/routines_screen.dart';
import 'package:flutter/material.dart';

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
      body: ListView(
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
          textAlign: TextAlign.justify,
        ),
        content: const Text(
          'Tem certeza que deseja dar padrão de fábrica ?',
          textAlign: TextAlign.justify,
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text(
              'Sim',
              textAlign: TextAlign.justify,
            ),
            onPressed: () async {
              consumo.padraoDeFabrica();
              await Future.delayed(Duration(seconds: 4));
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

Future<ConfirmAction> _reiniciar(BuildContext context) async {
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
          'Tem certeza que deseja dar reiniciar o dispositivo?',
          textAlign: TextAlign.justify,
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text(
              'Sim',
              textAlign: TextAlign.justify,
            ),
            onPressed: () async {
              consumo.reiniciar();
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

Future<ConfirmAction> _reconfig(BuildContext context) async {
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
          'Tem certeza que deseja reconfigurar os módulos ?',
          textAlign: TextAlign.justify,
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text(
              'Sim',
              textAlign: TextAlign.justify,
            ),
            onPressed: () async {
              consumo.reconfigurar();
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

Future<ConfirmAction> _atualizar(BuildContext context) async {
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
          'Tem certeza que deseja atualizar o dispositivo ?',
          textAlign: TextAlign.justify,
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text(
              'Sim',
              textAlign: TextAlign.justify,
            ),
            onPressed: () async {
              consumo.atualizar();
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

Future teste() {
  var testando = consumo.recebMsg();
  return testando;
}
