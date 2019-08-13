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
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            "Modo de Operação: ",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16.0),
          ),
          Divider( ),
          Text(
            "Nível de Acesso: ",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16.0),
          ),
          Divider( ),
          SizedBox(height: 10.0,),
          SizedBox(
            child: Container(
              height: 35.0,
              padding: EdgeInsets.all(8.0),
              child: Text("Meus Compartimentos",style: TextStyle(fontSize: 16.0, color: Colors.white),textAlign: TextAlign.center,),
              color: Colors.lightBlueAccent,
            ),
          ),
          SizedBox(height: 10.0,),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/door.png"),
            ),
            title: Text("Porta 01",style: TextStyle(fontWeight: FontWeight.w500),),
            onTap: (){
              launch(
                  "https://www.instagram.com/biccateca/?hl=pt-br");
            },
          ),
          Divider( ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/door.png"),
            ),
            title: Text("Porta 02",style: TextStyle(fontWeight: FontWeight.w500),),
            onTap: (){
              launch(
                  "https://www.instagram.com/biccateca/?hl=pt-br");
            },
          ),
          Divider( ),
          SizedBox(
            child: Container(
              height: 35.0,
              padding: EdgeInsets.all(8.0),
              child: Text("Opções",style: TextStyle(fontSize: 16.0, color: Colors.white),textAlign: TextAlign.center,),
              color: Colors.lightBlueAccent,
            ),
          ),
          SizedBox(height: 10.0,),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/rotinas2.png"),
            ),
            title: Text("Rotinas",style: TextStyle(fontWeight: FontWeight.w500),),
            onTap: (){
              launch(
                  "https://www.instagram.com/biccateca/?hl=pt-br");
            },
          ),
          Divider( ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/relatorio.jpg"),
            ),
            title: Text("Relatórios",style: TextStyle(fontWeight: FontWeight.w500),),
            onTap: (){
              launch(
                  "https://www.instagram.com/biccateca/?hl=pt-br");
            },
          ),
          Divider( ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/configure.jpg"),
            ),
            title: Text("Configurações",style: TextStyle(fontWeight: FontWeight.w500),),
            onTap: (){
              launch(
                  "https://www.instagram.com/biccateca/?hl=pt-br");
            },
          ),
          Divider( ),
        ],
      ),
    );
  }
}
