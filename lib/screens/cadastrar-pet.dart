import 'package:flutter/material.dart';
import 'package:mypetcare/screens/home.dart';
import 'package:mypetcare/widgets/my-appbar.dart';
import 'package:mypetcare/widgets/my-drawer.dart';

class CadastrarPet extends StatefulWidget {
  static const routeName = '/cadastrar-pet';
  @override
  _HomeStateState createState() => _HomeStateState();
}

class _HomeStateState extends State<CadastrarPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: myappBar(title: 'Cadastro de Pet'),
    
    body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    child: Icon(
                      Icons.photo_camera,
                      color: Colors.white.withOpacity(0.9),
                      size: 40,
                    ),
                    maxRadius: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Nome do Pet',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      ListTile(
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                        title: Text('Nome do Pet'),
                      ),
                      Divider(),
                      ListTile(
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                        title: Text('Classe '),
                      ),
                      Divider(),
                      ListTile(
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                        title: Text('Peso '),
                      ),
                      Divider(),
                      ListTile(
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                        title: Text('Idade'),
                      ),
                      Divider(),
                      ListTile(
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                        title: Text('Sair'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
