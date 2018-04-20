import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

import 'response.dart';
import 'ffxiv_ability.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:ffxiv_raid_planner/model/json_ability.dart';

enum ClassJob {
  PLD,
  DRK,
  WAR,
  WHM,
  SCH,
  AST,
  MNK,
  NIN,
  SAM,
  DRG,
  BLM,
  RDM,
  SMN,
  BRD,
  MCH
}
enum Role { Tank, Heal, Melee, Ranged, Caster }

class Character {
  final ClassJob classjob;  // e.g. WHM
  String name;
  Role role;          // e.g. Heal
  String iconPath;    // e.g. res/icons/classjobs/whm.png
  Map<String,Ability> abilityCatalog;

  // ------------------------------------------
  // Init
  
  Character({
    @required this.classjob,
    @required this.role,
    @required this.name,
  }) {
    initId();
    initIcon();
    initAbilityCatalog();
  }

  void initId() {
    switch (this.classjob) {
      case ClassJob.AST:
        this.name = (name == null) ? 'Alpha Centauri' : this.name;
        this.role = Role.Heal;
        break;
      case ClassJob.BLM:
        this.name = (name == null) ? 'Avada Kedavra' : this.name;
        this.role = Role.Caster;
        break;
      case ClassJob.BRD:
        this.name = (name == null) ? 'Das Nibelungenlied' : this.name;
        this.role = Role.Ranged;
        break;
      case ClassJob.DRG:
        this.name = (name == null) ? 'Ragnar Lodbrok' : this.name;
        this.role = Role.Melee;
        break;
      case ClassJob.DRK:
        this.name = (name == null) ? 'Lord Edgington' : this.name;
        this.role = Role.Tank;
        break;
      case ClassJob.MCH:
        this.name = (name == null) ? 'Leichenfaust Phaser' : this.name;
        this.role = Role.Ranged;
        break;
      case ClassJob.MNK:
        this.name = (name == null) ? 'Son Goku' : this.name;
        this.role = Role.Melee;
        break;
      case ClassJob.NIN:
        this.name = (name == null) ? 'Shikamaru Nara' : this.name;
        this.role = Role.Melee;
        break;
      case ClassJob.PLD:
        this.name = (name == null) ? 'Heathcliff' : this.name;
        this.role = Role.Tank;
        break;
      case ClassJob.RDM:
        this.name = (name == null) ? 'En Garde' : this.name;
        this.role = Role.Caster;
        break;
      case ClassJob.SAM:
        this.name = (name == null) ? 'Rurouni Kenshin' : this.name;
        this.role = Role.Melee;
        break;
      case ClassJob.SCH:
        this.name = (name == null) ? 'James Maxwell' : this.name;
        this.role = Role.Heal;
        break;
      case ClassJob.WHM:
        this.name = (name == null) ? 'Asia Argento' : this.name;
        this.role = Role.Heal;
        break;
      case ClassJob.WAR:
        this.name = (name == null) ? 'Fell Cleave' : this.name;
        this.role = Role.Tank;
        break;
      case ClassJob.SMN:
        this.name = (name == null) ? 'Eiko Carol' : this.name;
        this.role = Role.Heal;
        break;
      default:
        this.name = (name == null) ? 'Naoki Yoshida' : this.name;
        this.role = Role.Caster;
        break;
    }
  }

  void initIcon() => this.iconPath = 'res/images/icons/classjobs/${classjob.toString().toLowerCase()}.png';

  void initAbilityCatalog() {
    this.abilityCatalog = new Map<String,Ability>();
    String abilityRootPath = 'res/images/icons/abilities/$classjob/';
    Directory directory = new Directory(abilityRootPath);
    JsonRepo jsonRepo = new JsonRepo()..add(new JsonAbilitySerializer());
    Stream<FileSystemEntity> ls = directory.list();
    ls.listen((fsEntity) async {
      if(fsEntity is File) await _readAbilityData(abilityCatalog, jsonRepo, fsEntity.path);
    });
  }

  Future<Null> _readAbilityData(Map<String,Ability> abilityCatalog, JsonRepo jsonRepo, String sourcePath) async {
    String dataString = await rootBundle.loadString(sourcePath, cache: false);
    final JsonAbility jsonAbility = jsonRepo.deserialize(dataString, type: JsonAbility);
    abilityCatalog[jsonAbility.name] = new Ability(
      name: jsonAbility.name,
      recast: jsonAbility.recastTime,
      classjob: jsonAbility.classjobCategory,
      help: jsonAbility.help,
    );
  }

  // ------------------------------------------
  // House-keeping
  bool activateAbility(String name, int time) {
    if(abilityCatalog[name] != null) {
      abilityCatalog[name].activate(time: time);  // validity check done prior to activation request
      return true;
    } else return false;
  }

}