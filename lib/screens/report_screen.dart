import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.lightBlueAccent,
      title: Text('Relatórios'),
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
              backgroundImage: AssetImage("images/relatorio.jpg"),
            ),
            title: Text("Relatório de Ocupação"),
            onTap: () {},
          ),
          Divider(),
        ],
      ),
    );
  }
}
