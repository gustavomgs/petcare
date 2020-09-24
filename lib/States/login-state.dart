import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petcare/States/home-sate.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

String name, email, photoUrl;

class LoginState extends StatefulWidget {
  @override
  _LoginStateState createState() => _LoginStateState();
}

class _LoginStateState extends State<LoginState> {
  void initState() {
    super.initState();
  }

  Future<String> googleSignIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(authCredential);

    final User user = userCredential.user;

    assert(user.displayName != null);
    assert(user.email != null);
    assert(user.photoURL != null);

    setState(() {
      name = user.displayName;
      email = user.email;
      photoUrl = user.photoURL;
    });

    final User currentUser = _firebaseAuth.currentUser;
    assert(currentUser.uid == user.uid);

    return 'Logged In';
  }



  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              scale: 2,
            ),
            SizedBox(
              height: 30,
            ),
            SignInButton(
              Buttons.FacebookNew,
              onPressed: () => {},
              text: 'Entrar com Facebook',
            ),
            SignInButton(
              Buttons.GoogleDark,
              onPressed: () {
                googleSignIn().whenComplete(() {
                  if (email.isNotEmpty) {
                    Navigator.of(context).popAndPushNamed('/homestate');
                  } else {
                    return initState();
                  }
                });
              },
              text: 'Entrar com Google',
            ),
          ],
        ),
      ),
    );
  }

  void dispose() {
    build(context);
    super.dispose();
  }
}
