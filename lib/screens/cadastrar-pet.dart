import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mypetcare/screens/cadastro.dart';
import 'cadastro.dart';

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

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_petTypes);
    //_selectedPetType = _dropdownMenuItems[0].value;
    super.initState();
  }

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

  Widget build(BuildContext context) {
    String dropdownValue = 'Selecione o tipo do pet';

    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text("Cadastrar Pet"),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            children: [
              SizedBox(
                height: 100,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  labelText: 'Nome do pet',
                  hintText: "Ex: Jerry",
                ),
                validator: (name) {
                  if (name.isEmpty)
                    return 'campo obrigatório';
                  else if (name.trim().split('').length < 1)
                    return 'Preencha o nome do Pet';
                },
                onSaved: (name) => pets.name = name,
              ),
              SizedBox(
                height: 40,
              ),
              DropdownButton(
                value: _selectedPetType,
                items: _dropdownMenuItems,
                onChanged: onChangedDropdownItem,
                hint: Text('Selecione o tipo do pet'),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  labelText: 'Idade do pet',
                  hintText: "Ex: 2 Anos",
                ),
                validator: (idade) {
                  if (idade.isEmpty)
                    return 'campo obrigatório';
                  else if (idade.trim().split('').length < 1)
                    return 'Preencha a idade do Pet';
                },
                onSaved: (idade) => pets.idade = idade,
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  labelText: 'Peso do pet',
                  hintText: "Ex: 10 Kg",
                ),
                validator: (peso) {
                  if (peso.isEmpty)
                    return 'campo obrigatório';
                  else if (peso.trim().split('').length < 1)
                    return 'Preencha o peso do Pet';
                },
                onSaved: (peso) => pets.peso = peso,
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 44,
                child: RaisedButton(
                  color: Colors.blue[900],
                  child: Text(
                    'Salvar',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
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
