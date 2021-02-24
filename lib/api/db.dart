import 'package:cloud_firestore/cloud_firestore.dart';

class DB {
  final instance = FirebaseFirestore.instance;
}

//Global variable
DB db = DB();
