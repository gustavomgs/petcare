import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:mypetcare/data/data_pets.dart';
import 'package:mypetcare/models/pet.dart';

class PetManager with ChangeNotifier {
  final Map<String, PetsData> _items = {...DATA_PETS};

  List<PetsData> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  PetsData byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(PetsData petsData) {
    if (petsData == null) {
      return;
    }
    if (petsData.id != null &&
        petsData.id.trim().isNotEmpty &&
        _items.containsKey(petsData.id)) {
      _items.update(
          petsData.id,
          (_) => PetsData(
                id: petsData.id,
                avatarUrl: petsData.avatarUrl,
                idade: petsData.idade,
                name: petsData.name,
              ));
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => PetsData(
                id: id,
                name: petsData.name,
                avatarUrl: petsData.avatarUrl,
                idade: petsData.idade,
              ));
    }
    notifyListeners();
  }

  void removePet(PetsData petsData) {
    if (petsData != null && petsData.id != null) {
      _items.remove(petsData.id);
    }
  }
}
