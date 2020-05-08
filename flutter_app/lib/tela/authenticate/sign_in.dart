import 'package:flutter/material.dart';
import 'package:flutterapp/tela/authenticate/auth.dart';

class SignIn extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<SignIn>{
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text('Login'),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 50.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                      validator: (val) => val.isEmpty ? 'Insira o e-mail': null,
                      onChanged: (val){
                        setState(() => email = val);
                      }),
                  SizedBox(height: 20.0),
                  TextFormField(
                      obscureText: true,
                      validator: (val) => val.length < 6 ? 'Senha inválida, somente 6 ou mais dígitos': null,
                      onChanged: (val){
                        setState(() => password = val);
                      }),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Colors.blue[200],
                    child: Text(
                      'Entrar',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                        dynamic result = await _auth.EmailESenha(email, password);
                        if(result == null){
                          setState(() => error = 'Não foi possível logar com as informações acima');
                        }
                      }
                    },
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],)
          )),
    );
  }
}
