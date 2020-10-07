import 'package:flutter/material.dart';
import 'package:mypetcare/helpers/user-man.dart';
import 'package:mypetcare/helpers/user.dart';
import 'package:mypetcare/screens/login/login_screen.dart';
import 'package:mypetcare/widgets/buttons.dart';
import 'package:mypetcare/widgets/input-widgets.dart';

import 'package:mypetcare/widgets/my-appbar.dart';
import 'package:provider/provider.dart';

class SingPage extends StatefulWidget {
  static const String routeName = '/singpage';

  @override
  _SingPageState createState() => _SingPageState();
}

class _SingPageState extends State<SingPage> {
  final User user = User();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  void _pushPage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
      ModalRoute.withName('/loginPage'),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: loginBar(title: 'Cadastrar'),
      body: Center(
        child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (context, userManager, child) {
                return ListView(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  children: [
                    SizedBox(
                      height: 90,
                    ),
                    name(
                      onsaved: (name) => user.name = name,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    email(
                      onsaved: (email) => user.email = email,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    senha(
                      onsaved: (senha) => user.password = senha,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    conFirm(
                      onsaved: (senha) => user.confirmPassword = senha,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    raised(
                      child: userManager.loading
                          ? CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation(Colors.blue[900]),
                            )
                          : Text(
                              'Cadastrar',
                              style: TextStyle(color: Colors.white),
                            ),
                      ontap: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();

                          if (user.password != user.confirmPassword) {
                            scaffoldkey.currentState.showSnackBar(
                              SnackBar(
                                content: const Text('As senhas não são iguais'),
                                backgroundColor: Colors.redAccent,
                              ),
                            );
                          } else if (user.password == user.confirmPassword) {
                            context.read<UserManager>().signUp(
                                  user: user,
                                  onFail: (e) {
                                    scaffoldkey.currentState
                                        .showSnackBar(SnackBar(
                                      content: Text('$e'),
                                      backgroundColor: Colors.red,
                                    ));
                                  },
                                  sucesso: () {
                                    _pushPage();
                                  },
                                );
                          }
                        }
                      },
                    ),
                    SizedBox(height: 30),
                    myflat(
                      title: 'Já tenho uma conta',
                      ontap: () => Navigator.of(context)
                          .pushReplacementNamed('/loginPage'),
                    )
                  ],
                );
              },
            )),
      ),
    );
  }
}
