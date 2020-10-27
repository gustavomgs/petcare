import 'package:flutter/material.dart';
import 'package:petcare/pet/editpet/edit_petscreen.dart';
import 'package:petcare/pet/petscreen/pet_screen.dart';
import 'package:petcare/pet/models/pets.dart';
import 'package:petcare/pet/manager/pet_manager.dart';
import 'package:petcare/usuario/helpers/user-man.dart';
import 'package:petcare/screens/home.dart';
import 'package:petcare/screens/login/login_screen.dart';
import 'package:petcare/screens/singUp/singPage.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'screens/login/login_screen.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Pets pets;

  const MyApp({Key key, this.pets}) : super(key: key);

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
        localizationsDelegates: [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("pt", "BR"),
        ],
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
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/petscreen':
              return MaterialPageRoute(
                builder: (_) => PetScreen(
                  settings.arguments as Pets,
                ),
              );
            case '/editpetscreen':
              return MaterialPageRoute(
                builder: (_) => EditPetScreen(
                  settings.arguments as Pets,
                ),
              );
          }
        },
        home: _introScreen(),
      ),
    );
  }
}

Widget _introScreen() {
  return Consumer<UserManager>(builder: (context, userManager, child) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 7,
          backgroundColor: Colors.white,
          navigateAfterSeconds:
              userManager.isLoggedIn ? HomeState() : LoginScreen(),
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
  });
}

//TODO FAZER A PAGINA DE CADASTRO
//TODO FAZER A PADINA DE RECUPERAR SENHA VIA EMAIL
//TODO FAZER UM DRAWER COM NAVEGAÇÃO STATICA UTILIZANDO PROVIDER
