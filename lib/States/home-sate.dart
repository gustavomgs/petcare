import 'package:flutter/material.dart';
import 'package:petcare/Widgets/my-drawer.dart';

class HomeState extends StatefulWidget {
  static const String routeName = '/homestate';
  @override
  _HomeStateState createState() => _HomeStateState();
}

class _HomeStateState extends State<HomeState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            FloatingActionButton(child: Icon(Icons.add), onPressed: null),
        backgroundColor: Colors.blue,
        drawer: MyDrawer(),
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: null),
            IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                onPressed: null),
          ],
          elevation: 0,
        ),
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
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
                        title: Text('Vacinas'),
                      ),
                      Divider(),
                      ListTile(
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                        title: Text('Calculo Ração'),
                      ),
                      Divider(),
                      ListTile(
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                        title: Text('Medicamentos'),
                      ),
                      Divider(),
                      ListTile(
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                        title: Text('Banho e Tosa'),
                      ),
                      Divider(),
                      ListTile(
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                        title: Text('Peso'),
                      ),
                      Divider(),
                      ListTile(
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                        title: Text('Vermifugos'),
                      ),
                      Divider(),
                      ListTile(
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                        title: Text('Consulta Veterinária'),
                      ),
                      Divider(),
                      ListTile(
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                        title: Text('Alergia'),
                      ),
                      Divider(),
                      ListTile(
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                        title: Text('Anormalidade'),
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
