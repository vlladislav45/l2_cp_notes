import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:l2_notes/models/character.dart';

import 'db.dart';

class CPRepository {
  final String currentCollection = 'cp';
  final currentTime = Timestamp.now();

  Stream<QuerySnapshot> init() {
    return db.instance.collection(currentCollection).snapshots();
  }

  //This method filter all sold/free categories in main page by date-sold in descending row
  Stream<QuerySnapshot> filterByTimestamp() {
    return db.instance
        .collection(currentCollection)
        .orderBy('time_created', descending: true)
        .where('time_created', isLessThanOrEqualTo: this.currentTime)
        .snapshots();
  }

  Future<void> add(Character character) async {
    await db.instance.collection(currentCollection).add(character.toJson());
  }

  Future<void> delete(String uuid) async {
    await db.instance.collection(currentCollection).doc(uuid).delete();
  }
}
