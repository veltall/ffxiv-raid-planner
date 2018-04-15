import 'package:flutter/material.dart';
import 'encounter.dart';

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
const bAsset1 = 'res/images/icons/encounters/Sigmascape_V1.0.png';
const bAsset2 = 'res/images/icons/encounters/Sigmascape_V2.0.png';
const bAsset3 = 'res/images/icons/encounters/Sigmascape_V3.0.png';
const bAsset4 = 'res/images/icons/encounters/Sigmascape_V4.0.png';

class RaidPlannerApp extends StatelessWidget {
  final _title = "FFXIV Raid Planner";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: _title,
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
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
          backgroundColor: Theme.of(context).backgroundColor,
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
      itemExtent: 132.0,
      padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
      children: <Widget>[
        new Card(
          child: new Container(
            padding: const EdgeInsets.only(top: 40.0),
            decoration: new BoxDecoration(image: new DecorationImage(
              colorFilter: new ColorFilter.mode(Color(0x5F000000), BlendMode.overlay),
              fit: BoxFit.fitWidth,
              image: new AssetImage(bAsset1))),
            child: new ListTile(
              title: new Text('Sigmascape V1.0 (Savage)', style: new TextStyle(color: Colors.white, fontSize: 20.0),),
              subtitle: const Text('Author: velt', style: const TextStyle(color: Colors.white70, fontSize: 15.0, fontStyle: FontStyle.italic),),
              leading: new CircleAvatar(
                child: new Text("o5"),
              ),
            ),
          ),
        ),
        // o6s
        new Card(
          child: new Container(
            padding: const EdgeInsets.only(top: 40.0),
            decoration: new BoxDecoration(image: new DecorationImage(
              colorFilter: new ColorFilter.mode(Color(0x8F000000), BlendMode.overlay),
              fit: BoxFit.fitWidth,
              image: new AssetImage(bAsset2))),
            child: new ListTile(
              title: new Text('Sigmascape V2.0 (Savage)', style: new TextStyle(color: Colors.white, fontSize: 20.0),),
              subtitle: const Text('Author: velt', style: const TextStyle(color: Colors.white70, fontSize: 15.0, fontStyle: FontStyle.italic),),
              leading: new CircleAvatar(
                child: new Text('o6'),
              ),
            ),
          ),
        ),
        // o7s
        new Container(
          padding: const EdgeInsets.only(top: 40.0),
          decoration: new BoxDecoration(image: new DecorationImage(
            colorFilter: new ColorFilter.mode(Color(0xCF000000), BlendMode.overlay),
            fit: BoxFit.fitWidth,
            image: new AssetImage(bAsset3))),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new ListTile(
            title: new Text('Sigmascape V3.0 (Savage)', style: new TextStyle(color: Colors.white, fontSize: 20.0),),
            subtitle: const Text('Author: ranji', style: const TextStyle(color: Colors.white70, fontSize: 15.0, fontStyle: FontStyle.italic),),
            leading: new CircleAvatar(
              child: new Text('o7'),
            ),
          ),
        ),
        // o8s
        new Container(
          padding: const EdgeInsets.only(top: 40.0),
          decoration: new BoxDecoration(image: new DecorationImage(
            colorFilter: new ColorFilter.mode(Color(0x3F000000), BlendMode.overlay),
            fit: BoxFit.fitWidth,
            image: new AssetImage(bAsset4))),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new ListTile(
            title: new Text('Sigmascape V4.0 (Savage)', style: new TextStyle(color: Colors.white, fontSize: 20.0),),
            subtitle: const Text('Author: velt', style: const TextStyle(color: Colors.white70, fontSize: 15.0, fontStyle: FontStyle.italic),),
            leading: new CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: new AssetImage(kAsset2),
            ),
            onTap: () => _goToV4(context),
          ),
        ),
        new Container(
          padding: const EdgeInsets.only(top: 40.0),
          decoration: new BoxDecoration(image: new DecorationImage(
            colorFilter: new ColorFilter.mode(Color(0x3F000000), BlendMode.overlay),
            fit: BoxFit.fitWidth,
            image: new AssetImage(bAsset4))),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new ListTile(
            title: new Text('Sigmascape V4.0 (Savage)', style: new TextStyle(color: Colors.white, fontSize: 20.0),),
            subtitle: const Text('Author: velt', style: const TextStyle(color: Colors.white70, fontSize: 15.0, fontStyle: FontStyle.italic),),
            leading: new CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: new AssetImage(kAsset2),
            ),
            onTap: () => _goToV4(context),
          ),
        ),
        new Container(
          padding: const EdgeInsets.only(top: 40.0),
          decoration: new BoxDecoration(image: new DecorationImage(
            colorFilter: new ColorFilter.mode(Color(0x3F000000), BlendMode.overlay),
            fit: BoxFit.fitWidth,
            image: new AssetImage(bAsset4))),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new ListTile(
            title: new Text('Sigmascape V4.0 (Savage)', style: new TextStyle(color: Colors.white, fontSize: 20.0),),
            subtitle: const Text('Author: velt', style: const TextStyle(color: Colors.white70, fontSize: 15.0, fontStyle: FontStyle.italic),),
            leading: new CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: new AssetImage(kAsset2),
            ),
            onTap: () => _goToV4(context),
          ),
        ),
        new Container(
          padding: const EdgeInsets.only(top: 40.0),
          decoration: new BoxDecoration(image: new DecorationImage(
            colorFilter: new ColorFilter.mode(Color(0x3F000000), BlendMode.overlay),
            fit: BoxFit.fitWidth,
            image: new AssetImage(bAsset4))),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new ListTile(
            title: new Text('Sigmascape V4.0 (Savage)', style: new TextStyle(color: Colors.white, fontSize: 20.0),),
            subtitle: const Text('Author: velt', style: const TextStyle(color: Colors.white70, fontSize: 15.0, fontStyle: FontStyle.italic),),
            leading: new CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: new AssetImage(kAsset2),
            ),
            onTap: () => _goToV4(context),
          ),
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
