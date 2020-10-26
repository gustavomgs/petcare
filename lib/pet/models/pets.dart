import 'package:cloud_firestore/cloud_firestore.dart';

class Pets {
  Pets.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    name = document['name'] as String;
    idade = document['idade'] as double;
    type = document['type'] as String;
    images = List<String>.from(document.data['images'] as List<dynamic>);
  }

  String id;
  String name;
  double idade;
  String type;
  List<String> images;
}
