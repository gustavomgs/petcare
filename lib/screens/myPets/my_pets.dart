import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mypetcare/pet/components/card_pet.dart';
import 'package:mypetcare/pet/manager/pet_manager.dart';
import 'package:mypetcare/widgets/my-appbar.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';

class MyPets extends StatefulWidget {
  @override
  _MyPetsState createState() => _MyPetsState();
}

class _MyPetsState extends State<MyPets> {
  final firestoreInstance = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: myappBar(
        title: 'Meus Pets',
      ),
      body: Consumer<PetManager>(
        builder: (context, petManager, child) {
          return Container(
            child: petManager.allPets.length == 0
                ? Center(
                    child: Text('Não existem pets aqui'),
                  )
                : ListView.builder(
                    itemCount: petManager.allPets.length,
                    itemBuilder: (_, index) {
                      return CardPet(petManager.allPets[index]);
                    },
                  ),
          );
        },
      ),
    );
  }
}
