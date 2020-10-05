import 'package:flutter/material.dart';
import 'package:mypetcare/helpers/user-man.dart';
import 'package:mypetcare/helpers/user.dart';
import 'package:mypetcare/helpers/validators.dart';
import 'package:mypetcare/screens/login/login_screen.dart';

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
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            children: [
              SizedBox(
                height: 90,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Nome completo'),
                validator: (name) {
                  if (name.isEmpty)
                    return 'campo obrigatório';
                  else if (name.trim().split('').length <= 1)
                    return 'Preencha seu nome completo';
                },
                onSaved: (name) => user.name = name,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'E-mail'),
                obscureText: false,
                validator: (email) {
                  if (email.isEmpty)
                    return 'campo obrigatorio';
                  else if (!validaEmail(email)) return 'e-mail inválido';
                },
                onSaved: (email) => user.email = email,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Senha'),
                obscureText: true,
                validator: (senha) {
                  if (senha.isEmpty)
                    return 'campo obrigatorio';
                  else if (senha.length < 6) return 'senha muito curta';
                },
                onSaved: (senha) => user.password = senha,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Repita a senha'),
                obscureText: true,
                validator: (senha) {
                  if (senha.isEmpty)
                    return 'campo obrigatorio';
                  else if (senha.length < 6) return 'senha muito curta';
                },
                onSaved: (senha) => user.confirmPassword = senha,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 44,
                child: RaisedButton(
                    color: Colors.blue[900],
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();

                        if (user.password != user.confirmPassword) {
                          scaffoldkey.currentState.showSnackBar(
                            SnackBar(
                              content: const Text('As senhas não são iguais'),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        }
                        context.read<UserManager>().signUp(
                              user: user,
                              onFail: (e) {
                                scaffoldkey.currentState.showSnackBar(SnackBar(
                                  content: Text('$e'),
                                  backgroundColor: Colors.red,
                                ));
                              },
                              sucesso: () {
                                _pushPage();
                              },
                            );
                      }
                    }),
              ),
              SizedBox(height: 30),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/loginPage');
                },
                child: Text(
                  'Já tenho uma conta',
                  style: TextStyle(color: Colors.blue[900], fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
