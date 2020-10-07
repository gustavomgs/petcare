import 'package:flutter/material.dart';
import 'package:mypetcare/helpers/pet_man.dart';
import 'package:mypetcare/helpers/user-man.dart';
import 'package:mypetcare/screens/CadastratPet/cadastrar-pet.dart';
import 'package:mypetcare/screens/home.dart';
import 'package:mypetcare/screens/login/login_screen.dart';
import 'package:mypetcare/screens/singUp/singPage.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'screens/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => PetManager(),
          lazy: false,
        ),
      ],
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
          CadastrarPet.routeName: (context) => new CadastrarPet(),
        },
        home: _introScreen(),
      ),
    );
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 7,
        backgroundColor: Colors.white,
        navigateAfterSeconds: LoginScreen(),
        loaderColor: Colors.transparent,
      ),
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              scale: 3,
            ),
            SizedBox(
              height: 20,
            ),
            CollectionSlideTransition(
              children: <Widget>[
                Icon(
                  Icons.pets_outlined,
                  color: Colors.blue[900],
                ),
                Icon(
                  Icons.pets_outlined,
                  color: Colors.blue[900],
                ),
                Icon(
                  Icons.pets_outlined,
                  color: Colors.blue[900],
                ),
                Icon(
                  Icons.pets_outlined,
                  color: Colors.blue[900],
                ),
                Icon(
                  Icons.pets_outlined,
                  color: Colors.blue[900],
                ),
              ],
            ),
          ],
        ),
      )
    ],
  );
}

//TODO FAZER A PAGINA DE CADASTRO
//TODO FAZER A PADINA DE RECUPERAR SENHA VIA EMAIL
//TODO FAZER UM DRAWER COM NAVEGAÇÃO STATICA UTILIZANDO PROVIDER
