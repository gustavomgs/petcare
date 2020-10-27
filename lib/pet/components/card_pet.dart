import 'package:flutter/material.dart';

import 'package:petcare/pet/models/pets.dart';

class CardPet extends StatelessWidget {
  const CardPet(this.pets);
  final Pets pets;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            height: 100,
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    pets.images.first,
                    fit: BoxFit.cover,
                  ),
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
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'tipo: ${pets.type}',
                      style: TextStyle(
                          fontSize: 14, color: Colors.grey.withOpacity(0.8)),
                    ),
                    Text(
                      'Idade: ${pets.idade.toInt()}',
                      style: TextStyle(
                          fontSize: 14, color: Colors.grey.withOpacity(0.8)),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed('/petscreen', arguments: pets);
        });
  }
}
