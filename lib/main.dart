import 'package:flutter/material.dart';
import 'package:mypetcare/helpers/user-man.dart';
import 'package:mypetcare/screens/home.dart';
import 'package:mypetcare/screens/login/login_screen.dart';
import 'package:mypetcare/screens/singUp/singPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
     create: (_) => UserManager(),
      lazy: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PetCare',
        theme: ThemeData(
          primaryColor: Colors.blue[900],
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: '/',
        routes: {
          HomeState.routeName: (context) => new HomeState(),
          SingPage.routeName: (context) => new SingPage(),
          LoginScreen.routeName: (context) => new LoginScreen(),
        },
        home: LoginScreen(),
      ),
    );
  }
}

//TODO FAZER A PAGINA DE CADASTRO
//TODO FAZER A PADINA DE RECUPERAR SENHA VIA EMAIL
//TODO FAZER UM DRAWER COM NAVEGAÇÃO STATICA UTILIZANDO PROVIDER
