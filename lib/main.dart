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
        new Container(
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            image: new DecorationImage(
              fit: BoxFit.fitWidth,
              image: new AssetImage(bAsset1),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(boxShadow: <BoxShadow>[
                  new BoxShadow(
                    spreadRadius: -10.0,   // inset the shadow to be contained inside the Card
                    color: Colors.black54,
                    blurRadius: 10.0,
                  )
                ]),
                child: new ListTile(
                  title: new Text(
                    'Sigmascape V1.0 (Savage)',
                    style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  subtitle: const Text(
                    'Author: velt',
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic),
                  ),
                  leading: new CircleAvatar(
                    child: new Text('o5'),
                  ),
                ),
              ),
            ],
          ),
        ),
        new Container(
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            image: new DecorationImage(
              fit: BoxFit.fitWidth,
              image: new AssetImage(bAsset2),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(boxShadow: <BoxShadow>[
                  new BoxShadow(
                    spreadRadius: -10.0,   // inset the shadow to be contained inside the Card
                    color: Colors.black54,
                    blurRadius: 10.0,
                  )
                ]),
                child: new ListTile(
                  title: new Text(
                    'Sigmascape V2.0 (Savage)',
                    style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  subtitle: const Text(
                    'Author: velt',
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic),
                  ),
                  leading: new CircleAvatar(
                    child: new Text('o6'),
                  ),
                ),
              ),
            ],
          ),
        ),
        new Container(
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            image: new DecorationImage(
              fit: BoxFit.fitWidth,
              image: new AssetImage(bAsset3),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(boxShadow: <BoxShadow>[
                  new BoxShadow(
                    spreadRadius: -10.0,   // inset the shadow to be contained inside the Card
                    color: Colors.black54,
                    blurRadius: 10.0,
                  )
                ]),
                child: new ListTile(
                  title: new Text(
                    'Sigmascape V3.0 (Savage)',
                    style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  subtitle: const Text(
                    'Author: velt',
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic),
                  ),
                  leading: new CircleAvatar(
                    child: new Text('o7'),
                  ),
                ),
              ),
            ],
          ),
        ),
        new Container(
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            image: new DecorationImage(
              fit: BoxFit.fitWidth,
              image: new AssetImage(bAsset4),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(boxShadow: <BoxShadow>[
                  new BoxShadow(
                    spreadRadius: -10.0,   // inset the shadow to be contained inside the Card
                    color: Colors.black54,
                    blurRadius: 10.0,
                  )
                ]),
                child: new ListTile(
                  title: new Text(
                    'Sigmascape V4.0 (Savage)',
                    style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  subtitle: const Text(
                    'Author: velt',
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic),
                  ),
                  leading: new CircleAvatar(
                    child: new Text('o8'),
                  ),
                  onTap: () => _goToV4(context),
                ),
              ),
            ],
          ),
        ),
        new Container(
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            image: new DecorationImage(
              fit: BoxFit.fitWidth,
              image: new AssetImage(bAsset4),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(boxShadow: <BoxShadow>[
                  new BoxShadow(
                    spreadRadius: -10.0,   // inset the shadow to be contained inside the Card
                    color: Colors.black54,
                    blurRadius: 10.0,
                  )
                ]),
                child: new ListTile(
                  title: new Text(
                    'Sigmascape V4.0 (Savage)',
                    style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  subtitle: const Text(
                    'Author: velt',
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic),
                  ),
                  leading: new CircleAvatar(
                    child: new Text('o8'),
                  ),
                  onTap: () => _goToV4(context),
                ),
              ),
            ],
          ),
        ),
        new Container(
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            image: new DecorationImage(
              fit: BoxFit.fitWidth,
              image: new AssetImage(bAsset4),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(boxShadow: <BoxShadow>[
                  new BoxShadow(
                    spreadRadius: -10.0,   // inset the shadow to be contained inside the Card
                    color: Colors.black54,
                    blurRadius: 10.0,
                  )
                ]),
                child: new ListTile(
                  title: new Text(
                    'Sigmascape V4.0 (Savage)',
                    style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  subtitle: const Text(
                    'Author: velt',
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic),
                  ),
                  leading: new CircleAvatar(
                    child: new Text('o8'),
                  ),
                  onTap: () => _goToV4(context),
                ),
              ),
            ],
          ),
        ),
        new Container(
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            image: new DecorationImage(
              fit: BoxFit.fitWidth,
              image: new AssetImage(bAsset4),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(boxShadow: <BoxShadow>[
                  new BoxShadow(
                    spreadRadius: -10.0,   // inset the shadow to be contained inside the Card
                    color: Colors.black54,
                    blurRadius: 10.0,
                  )
                ]),
                child: new ListTile(
                  title: new Text(
                    'Sigmascape V4.0 (Savage)',
                    style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  subtitle: const Text(
                    'Author: velt',
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic),
                  ),
                  leading: new CircleAvatar(
                    child: new Text('o8'),
                  ),
                  onTap: () => _goToV4(context),
                ),
              ),
            ],
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
