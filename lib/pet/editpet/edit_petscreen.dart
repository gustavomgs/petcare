import 'package:flutter/material.dart';
import 'package:petcare/pet/components/image_form.dart';
import 'package:petcare/pet/models/pets.dart';
import 'package:petcare/widgets/my-appbar.dart';

class EditPetScreen extends StatelessWidget {
  EditPetScreen(this.pets);
  final Pets pets;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappBar(title: 'Editar Pet'),
      body: ListView(
        children: [
          ImageForm(pets),
        ],
      ),
    );
  }
}
