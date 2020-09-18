import 'package:flutter/material.dart';
import 'package:petcare/Widgets/login-button.dart';

class LoginState extends StatefulWidget {
  @override
  _LoginStateState createState() => _LoginStateState();
}

class _LoginStateState extends State<LoginState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logos.png',
                scale: 2,
              ),
              Text(
                'FAZER LOGIN',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(bottom: 100)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    LoginButton(
                      color: Color(0xff1A4789),
                      image: 'assets/face.png',
                      text: 'Entrar com Facebook',
                      route: 'homestate',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    LoginButton(
                      color: Color(0xffDC4E41),
                      image: 'assets/goog.png',
                      text: 'Entrar com Google',
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
