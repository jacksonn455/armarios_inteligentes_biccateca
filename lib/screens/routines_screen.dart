import 'package:armarios_inteligentes/screens/locker_screen.dart';
import 'package:armarios_inteligentes/screens/ocup_screen.dart';
import 'package:armarios_inteligentes/screens/user_screen.dart';
import 'package:armarios_inteligentes/widgets/request.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

request consumo = new request();

class RoutinesScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Rotinas'),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => LockerScreen())),
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
              backgroundImage: AssetImage("images/ocupacao.png"),
            ),
            title: Text("Ocupação"),
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) => OcupScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/user.png"),
            ),
            title: Text("Usuários"),
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) => UserScreen()));
            },
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
  Alert(
    context: context,
    type: AlertType.warning,
    title: "Tem certeza que deseja abrir todas as portas ?",
    buttons: [
      DialogButton(
        child: Text(
          "Sim",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () async{
          consumo.abrirTodasAsPortas();
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

