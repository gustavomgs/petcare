import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:petcare/pet/components/card_pet.dart';
import 'package:petcare/pet/manager/pet_manager.dart';
import 'package:petcare/usuario/helpers/user-man.dart';
import 'package:petcare/usuario/helpers/user.dart';
import 'package:petcare/widgets/buttons.dart';
import 'package:petcare/widgets/my-appbar.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final User user = User();
  final PetManager pets = PetManager();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappBar(
        title: 'Perfil',
      ),
      body: Container(
        child: Consumer<UserManager>(builder: (context, userManager, child) {
          return Center(
            child: Column(
              children: [
                headerContainer(
                  image: userManager.isLoggedIn
                      ? 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80'
                      : 'https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=639&q=80',
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      labelText(
                          leading: Icons.person,
                          hint: '${userManager.user.name}',
                          icon: Icons.edit_sharp,
                          onsaved: (name) => user.name = name),
                      labelText(
                          leading: Icons.email,
                          hint: '${userManager.user.email}',
                          icon: Icons.edit_sharp,
                          onsaved: (email) => user.email = email),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 15, 16, 20),
                        child: raised(
                          child: Text(
                            'Salvar',
                            style: TextStyle(color: Colors.white),
                          ),
                          ontap: () => context.read<UserManager>().update(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Meus',
                            style: TextStyle(
                                color: Colors.blue[900], fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Pets',
                            style: TextStyle(
                                color: Colors.yellow[900],
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget labelText({
    IconData leading,
    String title,
    String hint,
    IconData icon,
    Function onsaved,
  }) {
    return Container(
      child: ListTile(
        leading: Icon(leading),
        title: TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            labelText: title,
            // border: InputBorder.none,
          ),
          onSaved: onsaved,
        ),
        trailing: Icon(icon),
      ),
    );
  }

  Widget headerContainer({
    String image,
  }) {
    return Column(
      children: [
        Container(
          height: 200,
          child: Stack(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(60, 20),
                    // bottomRight: Radius.elliptical(60, 20),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  child: GestureDetector(
                    child: Icon(
                      Icons.photo_camera,
                      size: 70,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  backgroundImage: NetworkImage(image),
                  maxRadius: 90,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget myPets({String title, String desc}) {
    return Container(
      height: 250,
      child: ListView.builder(
        itemCount: pets.allPets.length,
        itemBuilder: (context, index) {
          return Consumer<PetManager>(
            builder: (context, petManager, child) {
              return Container(
                child: petManager.allPets.length == 0
                    ? Text('Não existem pets aqui')
                    : ListView.builder(
                        itemCount: petManager.allPets.length,
                        itemBuilder: (_, index) {
                          return CardPet(petManager.allPets[index]);
                        },
                      ),
              );
            },
          );
        },
      ),
    );
  }
}

Widget petPhoto() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(6),
    child: Container(
      child: Image.network(
          'https://images.unsplash.com/photo-1548681528-6a5c45b66b42?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
    ),
  );
}
