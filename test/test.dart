import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:ffxiv_raid_planner/model/ability.dart';
import 'package:ffxiv_raid_planner/model/user.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';

void main() {
  // read file for data as string
  var dataFile = new File('../res/db/aspectedbenefic.json');
  String dataString = dataFile.readAsStringSync();

  // deserialize string into object
  final abilitySerializer = new AbilityJsonSerializer();
  final jsonRepository = new JsonRepo()..add(abilitySerializer);
  final dataObj = jsonRepository.deserialize(dataString, type: Ability);
  // test result of deserialization
  print("Deserialized file content into object.");
  print("Ability.name = ${dataObj.name}");
  print("Ability.help = \n${dataObj.help}");

  // make modification to data
  dataObj.level = 69;
  dataObj.recastTime = 90;    // super buffed!

  // writing object data back to file via serialization
  final writeString = jsonRepository.serialize(dataObj);
  final filename = 'writeJsonHere.json';
  new File(filename).writeAsStringSync(writeString);
}

void testJaguar() {
  final userSerializer = new UserJsonSerializer();

  User user = userSerializer.fromMap({
    'name': 'John',
    'age': 25,
    'address': {
      "street":"Rainbow Road",
      "zipcode":"98069",
      "country":"Oz",
      "city":"Wizard",
    }
  });

  print(userSerializer.toMap(user));

  final jsonRepository = new JsonRepo()..add(new UserJsonSerializer());
  
  User user2 = jsonRepository.deserialize('{"name":"John","age": 25,"address":{"street":"Rainbow Road","zipcode":"98069","country":"Oz","city":"Wizard"}}', type: User);
  // print(jsonRepository.serialize(user2));
  print(user2.name);
}