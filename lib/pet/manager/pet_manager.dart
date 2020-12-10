import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:petcare/pet/models/pets.dart';
import 'package:petcare/screens/login/login_screen.dart';
import 'package:petcare/usuario/helpers/user-man.dart';
import 'package:petcare/usuario/helpers/user.dart';
import 'package:provider/provider.dart';
import 'package:petcare/screens/CadastratPet/cadastrar-pet.dart';

class PetManager extends ChangeNotifier {
  PetManager() {
    _loadAllPets();
  }

  LoginScreen user = new LoginScreen();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final Firestore firestore = Firestore.instance;

  List<Pets> allPets = [];

  Future<void> _loadAllPets() async {
    final QuerySnapshot snapPets = await firestore
        .collection('users')
        .document()
        .collection('pets')
        .getDocuments();

    allPets = snapPets.documents.map((e) => Pets.fromDocument(e)).toList();

    print("");

    notifyListeners();
  }
}
