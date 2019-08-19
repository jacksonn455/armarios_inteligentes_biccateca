import 'dart:async';
import 'package:armarios_inteligentes/models/user_model.dart';
import 'package:armarios_inteligentes/screens/NewLogin_screen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'ok_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading)
              return Center(
                child: CircularProgressIndicator(),
              );

            return Form(
              key: _formKey,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/wallpaper2.jpeg"),
                        fit: BoxFit.cover)),
                child: ListView(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Image.asset(
                                "images/logo2.png",
                                width: 200,
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: _nameController,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "WorkSansLight",
                                    fontSize: 15.0),
                                hintText: "Nome Completo",
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.white)),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              ),
                              validator: (text) {
                                if (text.isEmpty) return "Nome Inválido!";
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: _emailController,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "WorkSansLight",
                                    fontSize: 15.0),
                                hintText: "E-mail",
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (text) {
                                if (text.isEmpty || !text.contains("@"))
                                  return "E-mail inválido!";
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: _passController,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "WorkSansLight",
                                      fontSize: 15.0),
                                  hintText: "Senha",
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white)),
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: Colors.white,
                                  ),
                                ),
                              obscureText: true,
                              validator: (text) {
                                if (text.isEmpty || text.length < 6)
                                  return "Senha inválida!";
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: _addressController,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "WorkSansLight",
                                      fontSize: 15.0),
                                  hintText: "Endereço",
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white)),
                                  prefixIcon: const Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                ),
                              validator: (text) {
                                if (text.isEmpty) return "Endereço inválido!";
                              },
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            SizedBox(
                              height: 40.0,
                              width: 300.0,
                              child: new RaisedButton(
                                color: Colors.white,
                                child: Text(
                                  "Criar Conta",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    Map<String, dynamic> userData = {
                                      "name": _nameController.text,
                                      "email": _emailController.text,
                                      "address": _addressController.text
                                    };


                                    model.signUp(
                                        userData: userData,
                                        pass: _passController.text,
                                        onSuccess: _onSuccess,
                                        onFail: _onFail);
                                  }
                                },
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(30.0)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  void _onSuccess() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => OkScreen()));
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao criar usuário!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
