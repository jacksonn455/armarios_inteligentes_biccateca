import 'package:armarios_inteligentes/screens/signup_screen.dart';
import 'package:flutter/material.dart';


class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(
        top: 35
      ),
      onPressed: (){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context)=>SignUpScreen())
        );
      },
      child: Text(
        "Não possui uma conta? Cadastre-se!",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.bold,
            color: Colors.white,
          fontSize: 13,
          letterSpacing: 0.5
        ),
      ),
    );
  }
}
