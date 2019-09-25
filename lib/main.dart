import 'package:armarios_inteligentes/models/user_model.dart';
import 'package:armarios_inteligentes/screens/NewLogin_screen.dart';
import 'package:armarios_inteligentes/screens/home_screen.dart';
import 'package:armarios_inteligentes/screens/qrscan_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
          title: 'Armarios Inteligentes',
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/splashs4.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1700)).then((_) {
      if (UserModel.of(context).isLoggedIn()) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NewLoginScreen()));
      }
    });
  }
}
