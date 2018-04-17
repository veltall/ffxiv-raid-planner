import 'package:flutter/material.dart';
import 'encounter.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

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

const datapath = 'res/db/encounters/Sigmascape_V1.0_(Savage).json';

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
  Encounter encounter;
  List<Encounter> encs = <Encounter>[];

  @override
  void initState() {
    super.initState();
    _readO5Data();
    encs.add(new Encounter(
      title: "Sigmascape V2.0 (Savage)",
      author: "Ranji Suckass",
      enrage: 660,
      timelineData: [],
    ));
    encs.add(new Encounter(
      title: "Sigmascape V3.0 (Savage)",
      author: "Velt Krapfenwald'l",
      enrage: 690,
      timelineData: [],
    ));
    encs.add(new Encounter(
      title: "Sigmascape V4.0 (Savage)",
      author: "Velt Krapfenwald'l",
      enrage: 720,
      timelineData: [],
    ));
  }

  void _readO5Data() async {
    String dataString = await rootBundle.loadString(datapath);
    // print(dataString);
    Map encMap = json.decode(dataString);
    print(encMap["timeline"][49]);
    print(encMap["enrage"] is int);
    String title = encMap["title"];
    String author = encMap["author"];
    int enrage = encMap["enrage"];
    List timeline = encMap["timeline"];
    print("title is String: ${title is String}");
    print("timeline is List: ${timeline is List}");
    print("enrage is int: ${enrage is int}");

    /// TODO: The following assignment is problematic
    /// because timeline is a List<dynamic> and timelineData
    /// is strictly a List<Map<String,String>>
    /// To solve this problem, we need to use jaguar serializer
    /// for Encounter, or manually transfer the data over.

    // setState(() {
      // encs.add(
      //   new Encounter(
      //     title: title,
      //     author: author,
      //     enrage: enrage,
      //     timelineData: timeline,
      //   ),
      // );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      itemExtent: 132.0,
      padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
      children: <Widget>[
        new EncounterWidget(
          enc: encs[0],
          avatar: null,
          backgroundImage: bAsset1,
        ),
        new EncounterWidget(
          enc: encs[1],
          avatar: null,
          backgroundImage: bAsset2,
        ),
        new EncounterWidget(
          enc: encs[2],
          avatar: null,
          backgroundImage: bAsset3,
        ),
        // new EncounterWidget(
        //   enc: encs[3],
        //   avatar: kAsset2,
        //   backgroundImage: bAsset4,
        // ),
      ],
    );
  }
}
