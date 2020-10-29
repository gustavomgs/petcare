import 'package:age/age.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:petcare/pet/manager/pet_manager.dart';
import 'package:petcare/usuario/helpers/user-man.dart';
import 'package:petcare/screens/myPets/my_pets.dart';
import 'package:petcare/usuario/helpers/user.dart';
import 'package:petcare/widgets/my-appbar.dart';
import 'dart:math';

class CadastrarPet extends StatefulWidget {
  static const String routeName = '/cadastrarpet';

  @override
  _CadastrarPetState createState() => _CadastrarPetState();
}

class _CadastrarPetState extends State<CadastrarPet> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formDate = {};
  String dropdownValue;
  String _mesRef;

  DateTime today = DateTime.now();
  String bday2 = "";
  DateTime birthday = DateTime.now();
  AgeDuration age;

  String userId;

  final db = Firestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  List<PetType> _petTypes = PetType.getPetType();
  List<DropdownMenuItem<PetType>> _dropdownMenuItems;
  PetType _selectedPetType;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_petTypes);
    setState(() {
      _mesRef = 'anos';
    });
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
    return Scaffold(
      appBar: myappBar(title: ''),
      body: Form(
        key: _form,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              headerContainer(
                  image:
                      'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
                  ontap: null // (value) => _formDate['avatarUrl'] = '',
                  ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    mytexField(
                      type: TextInputType.name,
                      label: 'Nome',
                      initValue: _formDate['name'],
                      onsaved: (value) => _formDate['name'] = value,
                    ),
                    Container(
                      height: 60,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text('Data de Nascimento:'),
                          ),
                          Expanded(
                              child: Text(
                            bday2,
                            textAlign: TextAlign.center,
                          )),
                          IconButton(
                              icon: Icon(Icons.date_range),
                              color: Colors.blue,
                              onPressed: () {
                                datePicker();
                              }),
                        ],
                      ),
                    ),
                    DropdownButton(
                      value: _selectedPetType,
                      items: _dropdownMenuItems,
                      onChanged: onChangedDropdownItem,
                      hint: Text('Selecione o tipo do pet'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 90,
              ),
              saveButton(
                onTap: () {
                  final isValid = _form.currentState.validate();

                  _form.currentState.validate();

                  if (isValid) {
                    _form.currentState.save();
                    /* Provider.of<PetManager>(context, listen: false).put(
                      PetsData(
                        id: _formDate['id'],
                        avatarUrl: _formDate['avatarURl'] =
                            'https://images.unsplash.com/photo-1601758064224-c3c5ec910095?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1447&q=80',
                        idade: _formDate['idade'],
                        name: _formDate['name'],
                      ),
                    ); */

                    savePet(
                      _formDate["name"],
                      bday2,
                      _selectedPetType.type,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyPets()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void savePet(String name, age, type) async {
    final FirebaseUser user = await auth.currentUser();
    final String userID = user.uid;

    userId = userID;

    final String id = Random().nextInt(382643287).toString();

    print(userID);

    db.collection("users").document(userID).collection("pets").add({
      "id": id,
      "name": name,
      "age": age,
      "type": type,
    });
  }

  Future datePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      locale: Locale("pt", "BR"),
    );

    setState(() {
      if (date != null) {
        birthday = date;

        final bday = DateFormat("dd/MM/yyyy").format(date);

        bday2 = bday;
        age = Age.dateDifference(
            fromDate: birthday, toDate: today, includeToDate: false);

        print(
            "${age.years} ano(s), ${age.months} mês(es) e ${age.days} dia(s)");
      }
    });
  }

  Widget dropDown() {
    return DropdownButton<String>(
      value: _mesRef,
      iconSize: 24,
      elevation: 16,
      underline: Container(
        color: Colors.white,
        height: 1,
      ),
      style: TextStyle(
        color: Colors.blue[700],
        fontSize: 14,
      ),
      onChanged: (String newValue) {
        setState(() {
          _mesRef = newValue;
        });
      },
      items: <String>[
        'meses',
        'anos',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

Widget saveButton({
  Function onTap,
}) {
  return TextButton.icon(
    onPressed: onTap,
    icon: Icon(Icons.save),
    label: Text('Salvar'),
  );
}

Widget mytexField({
  String label,
  Function onsaved,
  String initValue,
  TextInputType type,
}) {
  return TextFormField(
    keyboardType: type,
    initialValue: initValue,
    decoration: InputDecoration(
      labelText: label,
    ),
    onSaved: onsaved,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Valor invalido';
      }
    },
  );
}

Widget headerContainer({
  String image,
  Function ontap,
}) {
  return Column(
    children: [
      Container(
        height: 200,
        child: Stack(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(60, 20),
                  // bottomRight: Radius.elliptical(60, 20),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                child: GestureDetector(
                  child: Icon(
                    Icons.photo_camera,
                    size: 70,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  onTap: ontap,
                ),
                backgroundImage: NetworkImage(image),
                maxRadius: 90,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

class PetType {
  int id;
  String type;

  PetType(this.id, this.type);

  static List<PetType> getPetType() {
    return <PetType>[
      PetType(1, "Cão"),
      PetType(2, "Felino"),
      PetType(3, "Ave"),
      PetType(4, "Reptile"),
      PetType(5, "Roedor"),
      PetType(6, "Peixe"),
    ];
  }
}
