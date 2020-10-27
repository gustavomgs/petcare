import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:petcare/pet/models/pets.dart';

class PetManager extends ChangeNotifier {
  PetManager() {
    _loadAllPets();
  }
  final Firestore firestore = Firestore.instance;
  List<Pets> allPets = [];
  Future<void> _loadAllPets() async {
    final QuerySnapshot snapPets =
        await firestore.collection('pets').getDocuments();

    allPets = snapPets.documents.map((e) => Pets.fromDocument(e)).toList();

    notifyListeners();
  }
}
