import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userDoFibase(FirebaseUser user){
    return user!= null ? User(uid: user.uid) : null;
  }

  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userDoFibase);
  }

  Future EmailESenha(String email, String password) async {
    try{
      AuthResult result = await _auth.
      signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userDoFibase(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}