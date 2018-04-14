/// This script browses xivdb.com and 
/// retrieves all the datafiles 
/// for actions in FFXIV


import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:ffxiv_raid_planner/model/ability.dart';
import 'dart:io';
import 'dart:async';

void main() {
  var id = 1;
  int limit = 5;
  int goal = 48;
  var url = 'https://api.xivdb.com/action/';
  final AbilityJsonSerializer abilityJsonSerializer = new AbilityJsonSerializer();
  final JsonRepo jsonRepo = new JsonRepo()..add(abilityJsonSerializer);
  Ability ability;
  RegExp spaceSelector = new RegExp(r"[\s|']+");
  downloadStuff(url, id, ability, jsonRepo, spaceSelector, limit, goal);
}

void downloadStuff(String url, int id, Ability ability, JsonRepo jsonRepo, RegExp spaceSelector, int limit, int goal){
  print('downloading item $id of $limit');
  http.read(url+"$id").then((dataString) {
    if (json.decode(dataString)["error"] == null) {
      ability = jsonRepo.deserialize(dataString, type: Ability);
      print("Processing ${ability.name}..");
      var writeString = jsonRepo.serialize(ability);
      String filename = '../res/db/' + ability.name.replaceAll(spaceSelector, "").toLowerCase()+".json";
      new File(filename).writeAsStringSync(writeString);
    } else {
      print(json.decode(dataString)["error"]);
    }
  });
  id++;
  if(id < limit) {
    downloadStuff(url, id, ability, jsonRepo, spaceSelector, limit, goal);
  } else if(limit < goal) {
    print('done one batch, sleeping a bit');
    sleep(new Duration(seconds: 2));
    downloadStuff(url, id, ability, jsonRepo, spaceSelector, limit+=5, goal);
  } else {
    sleep(new Duration(seconds: 2));
    return;
  }
}