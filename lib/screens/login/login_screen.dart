import 'package:flutter/material.dart';
import 'package:mypetcare/helpers/user-man.dart';
import 'package:mypetcare/helpers/user.dart';
import 'package:mypetcare/widgets/buttons.dart';
import 'package:mypetcare/widgets/input-widgets.dart';
import 'package:mypetcare/widgets/my-appbar.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: loginBar(),
      body: Center(
        child: Form(
          key: formkey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            shrinkWrap: true,
            children: [
              Container(
                height: 200,
                child: Image.asset('assets/logo.png'),
              ),
              fildEmail(
                controller: emailController,
                hint: 'E-mail',
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              fildLogin(
                controller: passcontroller,
                hint: 'Senha',
                obscure: true,
              ),
              forgotButton(),
              raised(ontap: () {
                if (formkey.currentState.validate()) {
                  context.read<UserManager>().singIn(
                      user: User(
                        email: emailController.text,
                        passowrd: passcontroller.text,
                      ),
                      onFail: (e) {
                        scaffoldkey.currentState.showSnackBar(SnackBar(
                          content: Text('$e'),
                          backgroundColor: Colors.red,
                        ));
                      },
                      sucesso: () {
                        Navigator.of(context).popAndPushNamed('/home');
                      });
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget forgotButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: FlatButton(
          padding: EdgeInsets.zero,
          onPressed: null,
          child: const Text('Esqueci minha Senha')),
    );
  }
}
