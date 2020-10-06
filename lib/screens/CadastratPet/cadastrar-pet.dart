import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mypetcare/helpers/pet.dart';
import '../../widgets/buttons.dart';
import '../../helpers/pet.dart';

class CadastrarPet extends StatefulWidget {
  static const String routeName = '/cadastrarpet';

  @override
  _CadastrarPetState createState() => _CadastrarPetState();
}

class _CadastrarPetState extends State<CadastrarPet> {
  final Pets pets = Pets();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String dropdownValue;

  List<PetType> _petTypes = PetType.getPetType();
  List<DropdownMenuItem<PetType>> _dropdownMenuItems;
  PetType _selectedPetType;

  List<DropdownMenuItem<PetType>> buildDropdownMenuItems(List petTypes) {
    List<DropdownMenuItem<PetType>> items = List();
    for (PetType petType in petTypes) {
      items.add(
        DropdownMenuItem(
          value: petType,
          child: Text(petType.type),
        ),
      );
    }
    return items;
  }

  onChangedDropdownItem(PetType selectedPetType) {
    setState(() {
      _selectedPetType = selectedPetType;
    });
  }

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_petTypes);

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
          title: Row(
        children: [
          Text('Cadastrar Pet'),
          SizedBox(
            width: 5,
          ),
          Icon(Icons.pets_rounded),
        ],
      )),
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: IconButton(
                      icon: Icon(
                        Icons.photo_camera,
                        size: 30,
                      ),
                      onPressed: null,
                    ),
                    maxRadius: 60,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1544568100-847a948585b9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80',
                        scale: 5),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButton(
                    underline: Container(
                      height: 1,
                      color: Colors.black26,
                    ),
                    value: _selectedPetType,
                    items: _dropdownMenuItems,
                    onChanged: onChangedDropdownItem,
                    hint: Text('Selecione o tipo do pet'),
                  ),
                  textFormField(
                    label: 'Nome do pet',
                    hint: "Ex: Jerry",
                    validator: (name) {
                      if (name.isEmpty)
                        return 'campo obrigatório';
                      else if (name.trim().split('').length < 1)
                        return 'Preencha o nome do Pet';
                    },
                    onSaved: (name) => pets.name = name,
                  ),
                  textFormField(
                    label: 'Idade do pet',
                    hint: "Ex: 2 Anos",
                    validator: (idade) {
                      if (idade.isEmpty)
                        return 'campo obrigatório';
                      else if (idade.trim().split('').length < 1)
                        return 'Preencha a idade do Pet';
                    },
                    onSaved: (idade) => pets.idade = idade,
                  ),
                  textFormField(
                    label: 'Peso do pet',
                    hint: "Ex: 10 Kg",
                    validator: (peso) {
                      if (peso.isEmpty)
                        return 'campo obrigatório';
                      else if (peso.trim().split('').length < 1)
                        return 'Preencha o peso do Pet';
                    },
                    onSaved: (peso) => pets.peso = peso,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  raised(
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.white),
                    ),
                    ontap: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        Navigator.pop(context);
                        Firestore.instance.collection('pets').add({
                          'Nome do Pet': pets.name.toString(),
                          'Tipo do pet': _selectedPetType.type,
                          'Idade do pet': pets.idade.toString(),
                          'Peso do pet': pets.peso.toString(),
                        });
                      }
                    },
                  ),
                  SizedBox(height: 30),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.blue[900], fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textFormField({
    String label,
    String hint,
    Function validator,
    Function onSaved,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 15),
        labelStyle: TextStyle(fontSize: 15),
        labelText: label,
        hintText: hint,
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}

class PetType {
  int id;
  String type;

  PetType(this.id, this.type);
  static List<PetType> getPetType() {
    return <PetType>[
      PetType(1, "Cachorro"),
      PetType(2, "Gato"),
      PetType(3, "Ave"),
      PetType(4, "Reptile"),
      PetType(5, "Roedor"),
      PetType(6, "Peixe"),
    ];
  }
}
