import 'package:flutter/material.dart';
import 'package:mypetcare/helpers/pet_man.dart';
import 'package:mypetcare/models/pet.dart';
import 'package:mypetcare/widgets/my-appbar.dart';
import 'package:mypetcare/widgets/pet_wid.dart';
import 'package:provider/provider.dart';

class MyPets extends StatefulWidget {
  @override
  _MyPetsState createState() => _MyPetsState();
}

class _MyPetsState extends State<MyPets> {
  @override
  @override
  Widget build(BuildContext context) {
    final PetManager pets = Provider.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
          onPressed: () {}),
      appBar: myappBar(title: 'Pets cadastrados'),
      body: ListView.builder(
        itemCount: pets.count,
        itemBuilder: (ctx, i) => Petwid(
          pets.byIndex(i),
        ),
      ),
    );
  }
}
