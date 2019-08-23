import 'package:armarios_inteligentes/screens/qrcode_screen.dart';
import 'package:armarios_inteligentes/screens/routines_screen.dart';
import 'package:flutter/material.dart';

class OptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Configurações'),
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
              backgroundImage: AssetImage("images/padrao.jpg"),
            ),
            title: Text("Padrão de Fábrica"),
            onTap:() async{
              final ConfirmAction action = await _asyncConfirmDialog(context);
              print("Confirmar $action");
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/qrcode.png"),
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
        title: Text('Confirmar',textAlign: TextAlign.center,),
        content: const Text('Tem certeza que deseja dar padrão de fábrica ?', textAlign: TextAlign.center,),
        actions: <Widget>[
          FlatButton(
            child: const Text('Sim',textAlign: TextAlign.center,),
            onPressed: () {
              consumo.padraoDeFabrica();
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