import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:l2_notes/api/cp_repo.dart';
import 'package:l2_notes/models/character.dart';

class CharacterBloc {
  CPRepository cpRepository;

  // final _firestoreController = BehaviorSubject<QuerySnapshot>();
  StreamController<QuerySnapshot> _characterListStreamController =
      StreamController<QuerySnapshot>();

  Stream<QuerySnapshot> get characterListStream =>
      _characterListStreamController.stream;

  CharacterBloc() {
    cpRepository = CPRepository();
  }

  void getCharactersByTimestamp() {
    cpRepository.filterByTimestamp().listen((event) {
      return _characterListStreamController.sink.add(event);
    });
  }

  void addNewCharacter(Character character) {
    cpRepository.add(character);
  }

  void deleteCharacter(String uuid) {
    cpRepository.delete(uuid);
  }

  void dispose() {
    _characterListStreamController.close();
  }
}
