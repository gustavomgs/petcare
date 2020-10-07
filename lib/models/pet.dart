import 'package:flutter/material.dart';

class PetsData {
  final String id;
  final String name;
  final String idade;
  final String avatarUrl;

  const PetsData({
    this.id,
    @required this.avatarUrl,
    @required this.idade,
    @required this.name,
  });

  factory PetsData.fromMap(Map<String, dynamic> json) => PetsData(
        id: json["id"],
        avatarUrl: json["avatarUrl"],
        idade: json["idade"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "name": name,
      "idade": idade,
      "avatarUrl": avatarUrl,
    };
  }
}
