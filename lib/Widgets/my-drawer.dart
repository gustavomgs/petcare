import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://media.discordapp.net/attachments/706822572385239072/748730026215604304/logo_petcarepng.png'),
                ),
                accountName: Text('Nome Usuario'),
                accountEmail: Text('usuarioemail.com')),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Cadastrar Pet'),
              onTap: () {},
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
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
