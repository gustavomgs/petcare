import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:mypetcare/helpers/errors.dart';
import 'package:mypetcare/helpers/user.dart';

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

 

  Future<void> singIn({User user, Function onFail, Function sucesso}) async {
    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.passowrd);
      sucesso();
    } on PlatformException catch (e) {
      print(getErrorString(e.code));
      onFail(getErrorString(e.code));
    }
  }

  Future<void> singUp({User user, Function onFail, Function sucesso}) async {
    try {
      final AuthResult result = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.passowrd);

      


      sucesso();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }
}
