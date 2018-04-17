import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:ffxiv_raid_planner/model/ability.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';

void main() {
   // read file for data as string
  var dataFile = new File('../res/db/spells/aspectedbenefic.json');
  String dataString = dataFile.readAsStringSync();

  // deserialize string into object
  final abilitySerializer = new AbilityJsonSerializer();
  final jsonRepository = new JsonRepo()..add(abilitySerializer);
  final Ability dataObj = jsonRepository.deserialize(dataString, type: Ability);
  // test result of deserialization
  print("Deserialized file content into object.");
  print("Ability.name = ${dataObj.name}");
  print("Ability.help = \n${dataObj.help}");

  // make modification to data
  dataObj.level = 69;
  dataObj.recastTime = 90;    // super buffed!

  // writing object data back to file via serialization
  final writeString = jsonRepository.serialize(dataObj);
  final filename = 'thisfiledidnotexist.json';
  new File(filename).writeAsStringSync(writeString);
}

void testTimeline() {
  String timelineString = '''{
    "title":"Sigmascape V1.0 (Savage)",
    "author":"velt", 
    "enrage": 650, 
    "timeline":[
      {
        "time":7,
        "title":"Heartless Angel",
        "desc":"Reduce party to 1HP (possibly lethal)"
      },
      {
        "time":12,
        "title":"Ultima",
        "desc":"Raidwide AoE"
      },
      {
        "time":25,
        "title":"Celestriad",
        "desc":"wombo-combo"
      }
    ]
  }''';
  Map timelineMap = json.decode(timelineString);
  print('fight: ${timelineMap["title"]}');
  print("author: ${timelineMap['author']}");
  print('all events: ${timelineMap["timeline"]}');
  print('2nd event: ${timelineMap["timeline"][1]}');
  print("2nd event's title and time: ${timelineMap["timeline"][1]["title"]} @ ${timelineMap["timeline"][1]["time"]}s");
}