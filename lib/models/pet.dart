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
}
