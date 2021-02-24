import 'package:l2_notes/logic/bloc/cp_bloc.dart';
import 'package:l2_notes/models/character.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatelessWidget {
  final DocumentSnapshot snapshot;

  const HomePageWidget([this.snapshot]);

  Widget getTextWidgets(List<dynamic> strings)
  {
    return new Row(children: strings.map((item) => new Text('$item, ')).toList());
  }

  @override
  Widget build(BuildContext context) {
    Character _character = Character.fromJson(snapshot.data());
    CharacterBloc _characterBloc = CharacterBloc();

    return Column(
      children: [
        ListTile(
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 44,
              minHeight: 44,
              maxWidth: 64,
              maxHeight: 64,
            ),
            child: Image.asset('assets/images/fists.png', fit: BoxFit.cover),
          ),
          title: Text(_character.name),
          trailing: InkWell(
            child: Icon(
              Icons.delete,
              size: 24,
            ),
          ),
          onTap: () {
            _characterBloc.deleteCharacter(snapshot.id);
          },
        ),

        getTextWidgets(_character.characters),
      ],
    );
  }
}
