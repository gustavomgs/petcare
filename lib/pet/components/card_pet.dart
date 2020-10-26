import 'package:flutter/material.dart';
import 'package:mypetcare/pet/models/pets.dart';

class CardPet extends StatelessWidget {
  CardPet(this.pets);
  final Pets pets;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        height: 100,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(pets.images.first),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pets.name,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  pets.type,
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  'Idade: ${pets.idade.toInt()}',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
