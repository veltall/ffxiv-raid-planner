import 'package:flutter/material.dart';
import 'encounter.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

// serialization
import 'model/json_encounter.dart';

/*
 * TODO:
 * Investigate the use of a Stepper Widget for 
 * the Response creation process
 *
 * */

//TODO:
void main() => runApp(new RaidPlannerApp());

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

  // TODO: Scan directory and load all available assets
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
    String dataString = await rootBundle.loadString(sourcePath, cache: false);
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
    return new ListView(
      itemExtent: 132.0,
      padding: const EdgeInsets.all(8.0),
      children: encounters.map((enc) {
        return enc.widget;
      }).toList(),
    );
  }
}
