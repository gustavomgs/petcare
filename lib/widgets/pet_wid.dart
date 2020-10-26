/*import 'package:flutter/material.dart';
import 'package:mypetcare/models/pet.dart';
import 'package:provider/provider.dart';

class Petwid extends StatelessWidget {
  final PetsData petsData;

  const Petwid(this.petsData);

  @override
  Widget build(BuildContext context) {
    final avatar = petsData.avatarUrl == null || petsData.avatarUrl.isEmpty
        ? CircleAvatar(
            child: Icon(Icons.pets),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage('${petsData.avatarUrl}'),
          );
    return Column(
      children: [
        ListTile(
          leading: avatar,
          title: Text(
            petsData.name,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          // subtitle: Text('${petsData.idade}'),
          trailing: Container(
            width: 100,
            child: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/cadastrarpet',
                        arguments: petsData,
                      );
                    }),
                IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text(
                            'Excluir',
                            textAlign: TextAlign.center,
                          ),
                          content: Text(
                            'Tem certeza que deseja realmente excluir este Pet  ?\nVocê perderá todas as informações armazenadas.',
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            FlatButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Não'),
                            ),
                            FlatButton(
                              onPressed: () {
                                Provider.of<PetManager>(context, listen: false)
                                    .removePet(petsData);
                                Navigator.pop(context);
                              },
                              child: Text('Sim'),
                            ),
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
*/
