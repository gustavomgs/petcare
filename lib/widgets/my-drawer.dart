import 'package:flutter/material.dart';
import 'package:mypetcare/helpers/user-man.dart';
import 'package:mypetcare/screens/CadastratPet/cadastrar-pet.dart';
import 'package:mypetcare/screens/User_profile.dart/user_profile.dart';
import 'package:mypetcare/screens/home.dart';
import 'package:mypetcare/screens/myPets/my_pets.dart';
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
              Container(
                padding: EdgeInsets.fromLTRB(20, 70, 20, 20),
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.blue[900]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: userManager.isLoggedIn
                          ? NetworkImage(
                              'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80')
                          : NetworkImage(
                              'https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=639&q=80'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        textAccount(
                          title:
                              'Olá, ${userManager.user?.name ?? 'Novo Usuário'}',
                        ),
                        textAccount(
                          title: '${userManager.user?.email ?? ''}',
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                            onTap: () {
                              if (userManager.isLoggedIn) {
                                userManager.singOut();
                              } else {
                                Navigator.of(context)
                                    .popAndPushNamed('/loginPage');
                              }
                            },
                            child: userManager.isLoggedIn
                                ? Text(
                                    'Sair',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    'Entre ou cadastre-se',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  )),
                      ],
                    )
                  ],
                ),
              ),
              listBuilderTile(
                title: 'Perfil',
                icon: Icons.person,
                onTap: () {
                  if (userManager.isLoggedIn) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserProfile()),
                    );
                  } else {}
                },
              ),
              listBuilderTile(
                title: 'Cadastrar Pet',
                icon: Icons.add,
                onTap: () {
                  if (userManager.isLoggedIn) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CadastrarPet()),
                    );
                  }
                },
              ),
              listBuilderTile(
                  title: 'Pets Cadastrados',
                  icon: Icons.pets,
                  onTap: () {
                    if (userManager.isLoggedIn) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyPets()),
                      );
                    } else {}
                  }),
              listBuilderTile(
                title: 'Medicamentos',
                icon: Icons.local_hospital,
              ),
              listBuilderTile(
                title: 'Calendário',
                icon: Icons.today,
              ),
              listBuilderTile(
                title: 'Cálculo ração',
                icon: Icons.tune,
              ),
              listBuilderTile(
                title: 'Sair',
                icon: Icons.exit_to_app,
                onTap: () => Navigator.pop(context),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget textAccount({
    String title,
  }) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget listBuilderTile({
    IconData icon,
    String title,
    Function onTap,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: Colors.blue[700],
          ),
          title: Text(title),
          onTap: onTap,
        ),
        Divider(
          indent: 20,
          endIndent: 20,
          color: Colors.black54,
        ),
      ],
    );
  }
}
