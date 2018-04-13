import 'package:flutter/material.dart';
import 'ffxiv_ability.dart';
import 'encounter.dart';

/*
 * TODO:
 * Investigate the use of a Stepper Widget for 
 * the Response creation process
 *
 * */

void main() => runApp(new RaidPlannerApp());

const kAsset1 = 'res/images/icons/FFVI-Suplex.png';
const kAsset2 = 'res/images/icons/kefka.png';

class RaidPlannerApp extends StatelessWidget {
  final _title = "FFXIV Raid Planner Tool";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: _title,
      theme: new ThemeData(
        primarySwatch: Colors.red,
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
        floatingActionButton: new FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: new Icon(Icons.list),
          elevation: 13.0,
          onPressed: null,
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

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: const EdgeInsets.only(top: 16.0, left: 8.0),
      children: <Widget>[
        // o5s
        new ListTile(
          title: new Text('Sigmascape V1.0 (Savage)'),
          leading: new CircleAvatar(
            backgroundImage: new AssetImage(kAsset1),
          ),
        ),
        // o6s
        new ListTile(
          title: new Text('Sigmascape V2.0 (Savage)'),
          leading: new CircleAvatar(
            child: new Text('o6s'),
          ),
        ),
        // o7s
        new ListTile(
          title: new Text('Sigmascape V3.0 (Savage)'),
          leading: new CircleAvatar(
            child: new Text('o7s'),
          ),
        ),
        // o8s
        new ListTile(
          title: new Text('Sigmascape V4.0 (Savage)'),
          leading: new CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: new AssetImage(kAsset2),
          ),
          onTap: () => _goToV4(context),
        ),
        new ListTile(
          title: new Text('Sigmascape V4.0 (Savage)'),
          leading: new CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: new AssetImage(kAsset2),
          ),
          onTap: () => _goToV4(context),
        ),
        new ListTile(
          title: new Text('Sigmascape V4.0 (Savage)'),
          leading: new CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: new AssetImage(kAsset2),
          ),
          onTap: () => _goToV4(context),
        ),
        new ListTile(
          title: new Text('Sigmascape V4.0 (Savage)'),
          leading: new CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: new AssetImage(kAsset2),
          ),
          onTap: () => _goToV4(context),
        ),
      ],
    );
  }

  _goToV4(BuildContext context) {
    // building data
    // events = new List.generate(240, (i) => 'event #${i*3}');
    List<Map<String, String>> events = new List.generate(240, (index) {
      Map<String, String> event = new Map<String, String>();
      int time = index * 3;
      event['time'] = time.toString();
      if (time % 11 == 0) {
        event['title'] = 'Raidwide';
        event['desc'] = 'Moderate, unavoidable AoE damage';
      } else if (time % 45 == 0) {
        event['title'] = 'Tank-Buster';
        event['desc'] = 'Heavy, single-hit damage';
      } else if (time % 39 == 0) {
        event['title'] = 'Targeted';
        event['desc'] = 'Heavy, avoidable AoE damage';
      } else {
        event['title'] = 'Auto-Attack';
        event['desc'] = 'Weak, continuous damage';
      }
      return event;
    });

    encounter = new Encounter(
      title: 'Sigmascape V4.0 (Savage)',
      enrage: 720,
      timelineData: events,
    );
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) {
          return new EncounterScreen(enc: encounter);
        },
      ),
    );
  }
}
