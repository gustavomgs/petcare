import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

class LoginButton extends StatefulWidget {
  final String image;
  final String text;
  final Color color;
  final String route;
  final int tag;

  LoginButton(
      {Key key, this.image, this.text, this.color, this.route, this.tag})
      : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _loginFacebook() async {
    FacebookLogin facebookLogin = FacebookLogin();

    final result = await facebookLogin.logIn(['email']);
    final token = result.accessToken.token;
    final graphResponse = await http.get(
        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token');
    print(graphResponse.body);
    if (result.status == FacebookLoginStatus.loggedIn) {
      final credential = FacebookAuthProvider.credential(token);
      _auth.signInWithCredential(credential);
      Navigator.of(context).pushNamed('/${widget.route}');
    } else {
      throw Exception('Requisição inválida!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: widget.color),
          height: 60,
          width: 350,
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  widget.image,
                  scale: 1,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  widget.text,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ],
          )),
      onTap: () {
        if (widget.tag == 1) {
          _loginFacebook();
        }
      },
    );
  }
}
