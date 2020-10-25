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

  factory SavePet.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data;
    return SavePet(
      id: data['id'],
      age: data['age'],
      name: data['name'],
    );
  }
}
