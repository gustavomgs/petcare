import 'package:flutter/material.dart';
import 'package:petcare/States/login-state.dart';

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
                  backgroundImage: NetworkImage(photoUrl),
                ),
                accountName: Text(name),
                accountEmail: Text(email)),
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
