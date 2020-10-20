import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mypetcare/helpers/user-man.dart';

UserManager _userManager = UserManager();

class SavePet {
  String name, age, id;

  SavePet({
    this.id,
    this.age,
    this.name,
  });

  final String uid = _userManager.user.id.toString();

  DocumentReference get firestoreRef =>
      Firestore.instance.document('users/$uid/pets/$id');

  Future<void> savePets() async {
    await firestoreRef.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}
