import 'package:flutter/material.dart';
import 'encounter.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

// serialization
import 'model/json_encounter.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

/*
 * TODO:
 * Investigate the use of a Stepper Widget for 
 * the Response creation process
 *
 * */

//TODO:
void main() => runApp(new RaidPlannerApp());

const kAsset1 = 'res/images/icons/FFVI-Suplex.png';
const kAsset2 = 'res/images/icons/kefka.png';
const bAsset1 = 'res/images/icons/encounters/Sigmascape_V1.0_(Savage).png';
const bAsset2 = 'res/images/icons/encounters/Sigmascape_V2.0_(Savage).png';
const bAsset3 = 'res/images/icons/encounters/Sigmascape_V3.0_(Savage).png';
const bAsset4 = 'res/images/icons/encounters/Sigmascape_V4.0_(Savage).png';

class RaidPlannerApp extends StatelessWidget {
  final _title = "FFXIV Raid Planner";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: _title,
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: Colors.indigo,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
        ),
        drawer: new Drawer(
          elevation: 12.0,
          child: new Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountEmail: new Text('veltalldev@gmail.com'),
                accountName: new Text('VD'),
                margin: EdgeInsets.zero,
              ),
              new Container(
                height: 300.0,
                width: 300.0,
                child: new Center(
                  child: new Text('center of drawer body'),
                ),
              ),
            ],
          ),
        ),
        body: new MainScreen(),
        floatingActionButton: new FloatingActionButton.extended(
          label: new Text('Encounter'),
          icon: new Icon(Icons.playlist_add),
          onPressed: () => print('adding stuff'),
          heroTag: null,
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Encounter> encounters = <Encounter>[];

  @override
  void initState() {
    super.initState();
    var encLoader = <Encounter>[];
    _loadData(encLoader).then((encs) => setState(() => encounters = encs));
  }

  Future<List<Encounter>> _loadData(List<Encounter> encs) async {
    await _readEncounterData(encs, 'res/db/encounters/Sigmascape_V1.0_(Savage).json');
    await _readEncounterData(encs, 'res/db/encounters/Sigmascape_V2.0_(Savage).json');
    await _readEncounterData(encs, 'res/db/encounters/Sigmascape_V3.0_(Savage).json');
    await _readEncounterData(encs, 'res/db/encounters/Sigmascape_V4.0_(Savage).json');
    await _readEncounterData(encs, 'res/db/encounters/Sigmascape_V4.0_(Savage).json');
    await _readEncounterData(encs, 'res/db/encounters/Sigmascape_V4.0_(Savage).json');
    await _readEncounterData(encs, 'res/db/encounters/Sigmascape_V4.0_(Savage).json');
    return encs;
  }

  Future<Null> _readEncounterData(List<Encounter> encs, String sourcePath) async {
    String dataString = await rootBundle.loadString(sourcePath);
    Map encMap = json.decode(dataString);
    final jsonEncounterSerializer = new JsonEncounterSerializer();
    final JsonEncounter enc = jsonEncounterSerializer.fromMap(encMap);
    setState(() {
      encs.add(
        new Encounter(
          title: enc.title,
          author: enc.author,
          enrage: enc.enrage,
          timelineData: enc.timelineData,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> bgImgs = <String>[bAsset1, bAsset2, bAsset3, bAsset4];
    return new ListView(
      itemExtent: 132.0,
      children: encounters.map((enc) {
        return enc.widget;
      }).toList(),
    );
  }
}
