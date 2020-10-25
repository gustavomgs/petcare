import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mypetcare/helpers/pet_man.dart';
import 'package:mypetcare/helpers/pet_manager_test.dart';
import 'package:mypetcare/models/pet.dart';
import 'package:mypetcare/widgets/my-appbar.dart';
import 'package:mypetcare/widgets/pet_wid.dart';
import 'package:provider/provider.dart';

List<SavePet> finalPetList = [];

class MyPets extends StatefulWidget {
  @override
  _MyPetsState createState() => _MyPetsState();
}

class _MyPetsState extends State<MyPets> {
  SavePet _pet = SavePet();

  final String uid = SavePet().uid;
  final firestoreInstance = Firestore.instance;

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
        itemCount: finalPetList.length
        itemBuilder: ,
      ),
    );
  }

  PetList() async {
    List pet_list = await Firestore.instance
        .collection("users")
        .document(uid)
        .collection("pets")
        .getDocuments()
        .then((val) => val.documents);

    for (int i = 0; i < pet_list.length; i++) {
      Firestore.instance
          .collection("users")
          .document(pet_list[i].documentID.toString())
          .collection("pets")
          .snapshots()
          .listen(CreatePetList);
    }
  }

  CreatePetList(QuerySnapshot snapshot) async {
    var docs = snapshot.documents;
    for (var Doc in docs) {
      finalPetList.add(SavePet.fromFireStore(Doc));
    }
  }
}
