import 'package:flutter/material.dart';
import 'package:mypetcare/helpers/user-man.dart';
import 'package:mypetcare/screens/CadastratPet/cadastrar-pet.dart';
import 'package:mypetcare/screens/home.dart';
import 'package:mypetcare/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

class Mydrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  'Olá, ${userManager.user?.name ?? ''}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                accountEmail: Text(
                  '${userManager.user?.email ?? ''}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),

                //TODO TERMINAR LISTA DE WIDGETS
                //TODO ROTAS DO DRAWER
              ),
              ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Inicio'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeState()),
                    );
                  }),
              ListTile(
                leading: Icon(Icons.add),
                title: Text('Cadastrar Pet'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CadastrarPet()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.local_hospital),
                title: Text('Medicamentos'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.today),
                title: Text('Calendário'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.tune),
                title: Text('Calculo de Ração'),
                onTap: () {},
              ),
              Divider(
                thickness: 0.9,
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Sair'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
