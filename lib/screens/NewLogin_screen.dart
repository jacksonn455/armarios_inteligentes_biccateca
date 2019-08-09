import 'package:armarios_inteligentes/models/user_model.dart';
import 'package:armarios_inteligentes/screens/home_screen.dart';
import 'package:armarios_inteligentes/widgets/sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class NewLoginScreen extends StatefulWidget {
  @override
  _NewLoginScreenState createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
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
                            padding: EdgeInsets.only(top: 0),
                            child: Image.asset(
                              "images/logo2.png",
                              width: 200,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
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
                                  borderSide: BorderSide(color: Colors.white)),
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
                                  borderSide: BorderSide(color: Colors.white)),
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                              onPressed: () {
                                if (_emailController.text.isEmpty)
                                  _scaffoldKey.currentState
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        "Insira seu e-mail para recuperação!"),
                                    backgroundColor: Colors.redAccent,
                                    duration: Duration(seconds: 2),
                                  ));
                                else {
                                  model.recoverPass(_emailController.text);
                                  _scaffoldKey.currentState
                                      .showSnackBar(SnackBar(
                                    content: Text("Confira seu e-mail!"),
                                    backgroundColor: Colors.purple,
                                    duration: Duration(seconds: 3),
                                  ));
                                }
                              },
                              child: Text(
                                "Esqueci minha senha",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.0),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 50,
                            width: 350,
                            child: new RaisedButton(
                                color: Colors.white,
                                child: Text(
                                  "Entrar",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {}
                                  model.signIn(
                                      email: _emailController.text,
                                      pass: _passController.text,
                                      onSuccess: _onSuccess,
                                      onFail: _onFail);
                                },
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0))),
                          ),
                          SignUpButton(),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Image.asset(
                              "images/biccateca1.png",
                              width: 150,
                              height: 150,
                              fit: BoxFit.contain,
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
      ),
    );
  }

  void _onSuccess() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao Entrar!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 3),
    ));
  }
}
