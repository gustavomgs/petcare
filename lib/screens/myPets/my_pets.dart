import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petcare/pet/components/card_pet.dart';
import 'package:petcare/pet/manager/pet_manager.dart';
import 'package:petcare/widgets/my-appbar.dart';
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
            child: ListView.builder(
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
