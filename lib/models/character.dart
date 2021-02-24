
import 'package:cloud_firestore/cloud_firestore.dart';

class Character {
  String _name;
  List<dynamic> _characters;
  Timestamp _timeCreated;

  Character([this._name, this._characters, this._timeCreated]);

  String get name => _name;

  List<dynamic> get characters => _characters;

  Timestamp get timeCreated => _timeCreated;

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      json['name'],
      json['classNames'].toList(),
      json['time_created'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': this.name,
    'classNames': this.characters,
    'time_created': this.timeCreated,
  };
}