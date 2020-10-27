import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:petcare/pet/models/pets.dart';

class PetScreen extends StatelessWidget {
  const PetScreen(this.pets);
  final Pets pets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${pets.name}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed('/editpetscreen', arguments: pets);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Carousel(
              images: pets.images.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: 4,
              dotSpacing: 15,
              dotBgColor: Colors.transparent,
              autoplay: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  pets.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Divider(
                  endIndent: 20,
                  indent: 20,
                ),
                Text('${pets.name} tem ${pets.idade} anos de idade '),
                ListTile(
                  leading: Icon(
                    Icons.pets,
                    size: 20,
                  ),
                  title: Text(
                    'tipo: ${pets.type}',
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
