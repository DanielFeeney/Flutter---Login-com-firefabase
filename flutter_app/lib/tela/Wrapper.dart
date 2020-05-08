import 'package:flutter/material.dart';
import 'package:flutterapp/models/user.dart';
import 'package:flutterapp/tela/authenticate/sign_in.dart';
import 'package:flutterapp/tela/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  _Wrapper createState() => _Wrapper();
}

class _Wrapper extends State<Wrapper>{
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user == null){
      return SignIn();
    }
    else{
      return Home();
    }

  }
}
