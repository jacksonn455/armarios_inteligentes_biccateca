import 'package:armarios_inteligentes/models/user_model.dart';
import 'package:armarios_inteligentes/screens/NewLogin_screen.dart';
import 'package:armarios_inteligentes/screens/home_screen.dart';
import 'package:armarios_inteligentes/screens/locker_screen.dart';
import 'package:armarios_inteligentes/screens/qrscan_screen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class DoorScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(home: SplashD()),
    );
  }
}

class SplashD extends StatefulWidget {
  @override
  _SplashDState createState() => _SplashDState();
}

class _SplashDState extends State<SplashD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                height: 300,
                width: 300,
                child: FlareActor(
                  "assets/door.flr",
                  animation: "open",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Abrindo porta ...",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
    Future.delayed(Duration(milliseconds: 1500)).then((_) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LockerScreen()));
    });
  }
}
