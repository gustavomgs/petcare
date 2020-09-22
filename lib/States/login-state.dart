import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:petcare/States/home-sate.dart';
import 'package:petcare/blocs/auth_bloc.dart';
import 'package:provider/provider.dart';

class LoginState extends StatefulWidget {
  @override
  _LoginStateState createState() => _LoginStateState();
}

class _LoginStateState extends State<LoginState> {
  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 100),
          child: Expanded(
            child: Container(
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
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 100)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SignInButton(
                          Buttons.FacebookNew,
                          onPressed: () => authBloc.loginFacebook(),
                          text: 'Entrar com Facebook',
                        ),
                        /* LoginButton(
                          color: Color(0xff1A4789),
                          image: 'assets/face.png',
                          text: 'Entrar com Facebook',
                          route: 'homestate',
                          tag: 1,
                        ), */
                        SizedBox(
                          height: 5,
                        ),
                        SignInButton(
                          Buttons.GoogleDark,
                          onPressed: () => Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (context) => HomeState())),
                          text: 'Entrar com Google',
                        ),
                        /* LoginButton(
                          color: Color(0xffDC4E41),
                          image: 'assets/goog.png',
                          text: 'Entrar com Google',
                          route: 'homestate',
                          tag: 2,
                        ), */
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
