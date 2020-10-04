import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mypetcare/screens/cadastro.dart';
import 'cadastro.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';


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
  
  @override
  void initState() {  
            setState(() {
              dropdownValue = 'Selecione o tipo do pet';
            });
      super.initState();
      }
    
     
  
   Widget build(BuildContext context) {
     String dropdownValue;
     
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            children: [
              SizedBox(
                height:100,
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
                  else if (name.trim().split('').length <= 1)
                    return 'Preencha o nome do Pet';
                },
                onSaved: (name) => pets.name = name,
              ),
              SizedBox(
               height: 40,
              ),
      DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
       style: TextStyle(color: Colors.black),
      underline: Container(               
        height: 2,
        color: Colors.black38,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Selecione o tipo do pet','Cães', 'Felinos', 'Roedores', 'Aves','Repteis']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
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
                  else if (idade.trim().split('').length <= 1)
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
                  else if (peso.trim().split('').length <= 1)
                    return 'Preencha o peso do Pet';
                },
                
                onSaved: (peso) => pets.peso = peso,
              ), SizedBox(
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
                        
                      }
                      Navigator.pop(context);
                      Firestore.instance.collection('pets').add({
                        'Nome do Pet': pets.name.toString() ,
                        'Tipo do pet': dropdownValue,
                        'Idade do pet': pets.idade.toString(),
                        'Peso do pet': pets.peso.toString(),
                      });

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
   
