import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:l2_notes/logic/bloc/cp_bloc.dart';
import 'package:l2_notes/models/character.dart';
import 'package:firestore_ui/firestore_ui.dart';
import 'package:l2_notes/widgets/home_page_widget.dart';

class HomePage extends StatefulWidget {

  @override
  StateHomePage createState() => StateHomePage();
}

class StateHomePage extends State<HomePage> {
  CharacterBloc _characterBloc = CharacterBloc();

  createAlertDialog(BuildContext context) {
    TextEditingController playerNameController = TextEditingController();
    TextEditingController characterController = TextEditingController();

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Add new player to yours CP'),
        content: Column(
          children: [
            Text('Enter player name'),
            TextField(
              controller: playerNameController,
            ),

            SizedBox(
              height: 15,
            ),

            Text('Enter classNames, note: You should use comma(,) className',
            textAlign: TextAlign.center,),
            TextField(
              controller: characterController,
            ),
          ],
        ),
        actions: [
          MaterialButton(
            elevation: 5.0,
            child: Text('Add'),
            onPressed: () {
              String playerName = playerNameController.value.text;

              final split = characterController.value.text.split(', ');
              final List<String> values = [
                for (int i = 0; i < split.length; i++)
                  split[i]
              ];

              Timestamp currentTime = Timestamp.now();

              _characterBloc.addNewCharacter(Character(playerName, values, currentTime));

              Navigator.pop(context);
            }
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _characterBloc.getCharactersByTimestamp();

    return Scaffold(
      appBar: AppBar(
        title: Text('Lineage 2 CP Notes'),
      ),
      body: Center(
        child: Column(
          children: [
            StreamBuilder(
                stream: _characterBloc.characterListStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData) {
                    return const Text('Loading..');
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.docs.length,
                        //Loop all categories
                        itemBuilder: (context, index) => HomePageWidget(
                          snapshot.data.docs[index],
                      ),
                  );
                }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {
          createAlertDialog(context);
        },
      ),
    );
  }
}