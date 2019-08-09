import 'package:armarios_inteligentes/models/user_model.dart';
import 'package:armarios_inteligentes/screens/NewLogin_screen.dart';
import 'package:armarios_inteligentes/screens/home_screen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class OkScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
          title: 'Criar Conta',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: Splash()),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Container(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Container(
                height: 340,
                width: 340,
                child: FlareActor("assets/ok4.flr", animation: "certo",),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1700)).then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => NewLoginScreen()));
    });
  }
}
