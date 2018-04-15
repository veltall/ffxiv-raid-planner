/// This script browses xivdb.com and
/// retrieves all the datafiles
/// for actions in FFXIV

/// TODO: look into using android_alarm_manager plugin for Dart
/// to manage rate limit when querying db

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:ffxiv_raid_planner/model/ability.dart';
import 'dart:io';
import 'dart:async';

void main() async {
  final AbilityJsonSerializer abilityJsonSerializer =
      new AbilityJsonSerializer();
  final JsonRepo jsonRepo = new JsonRepo()..add(abilityJsonSerializer);

  String searchdb = new File('../res/db/ability-search.json').readAsStringSync(); 
  var db = json.decode(searchdb);
  
  int index = 0;
  int goal = db.length;
  while (index < db.length) {
    print('processing item $index/$goal');
    String url = db[index]['icon'];
    String name = db[index]['name'];
    RegExp spaceSelector = new RegExp(r"[\s|']+");
    String filename = '../../res/images/icons/abilities/' +
      name.replaceAll(spaceSelector, "").toLowerCase() +
      ".png";
      print('processing skill $name at $url, saving to $filename');
    await downloadItem(url, jsonRepo, filename);
    index++;
  }
}

Future<Null> downloadItem(String url, JsonRepo jsonRepo, String filename) async {
  print('received download request for $url');
  await http.readBytes(url).then((data) {
    // if (json.decode(data)["error"] == null) {
      // Ability ability = jsonRepo.deserialize(data, type: Ability);
      // print("Processing ${ability.name}");
      // var writeString = jsonRepo.serialize(ability);
      new File(filename).writeAsBytesSync(data);
    // } else print(json.decode(data)["error"]);
  });
}
