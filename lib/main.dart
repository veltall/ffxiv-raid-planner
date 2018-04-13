import 'package:flutter/material.dart';
import 'ffxiv_ability.dart';
import 'encounter.dart';

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
  final GlobalKey<ScaffoldState> _globalScaffoldKey =
      new GlobalKey<ScaffoldState>();

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
      int time = index*3;
      event['time'] = time.toString();
      if (time % 11 == 0) {
        event['title'] = 'Raidwide';
        event['desc'] = 'Moderate, unavoidable AoE damage';
      } else if (time % 45 == 0) {
        event['title'] = 'Tank-Buster';
        event['desc'] = 'Heavy, single-hit damage';
      } else if (time % 39 == 0){
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
          return new EncounterScreen(scaffoldKey: _globalScaffoldKey, enc: encounter);
        },
      ),
    );
  }
}

// ----------------------------------------------

// class EncounterScreen extends StatefulWidget {
//   final GlobalKey<ScaffoldState> _globalScaffoldKey;
//   EncounterScreen(this._globalScaffoldKey);

//   @override
//   _EncounterScreenState createState() => new _EncounterScreenState();
// }

// class _EncounterScreenState extends State<EncounterScreen> {
//   GlobalKey<ScaffoldState> _scaffoldKey;
//   List<String> events;
//   VoidCallback _showBottomSheetCallback;

//   @override
//   void initState() {
//     super.initState();
//     _scaffoldKey = widget._globalScaffoldKey;
//     // _showBottomSheetCallback = _showBottomSheet;
//     events = new List.generate(140, (i) => 'event #${i*3}');
//   }

//   void _showBottomSheet(int i) {
//     setState(() {
//       _showBottomSheetCallback = null;
//     });
//     _scaffoldKey.currentState
//         .showBottomSheet<Null>((BuildContext context) {
//           final ThemeData themeData = Theme.of(context);
//           return new Container(
//             decoration: new BoxDecoration(
//               border: new Border(
//                 top: new BorderSide(color: themeData.disabledColor),
//               ),
//             ),
//             child: new Padding(
//                 padding: const EdgeInsets.all(32.0),
//                 child: Container(
//                   child: new Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       new AbilityWidget(
//                         ability: new Ability(
//                           name: 'Rampart',
//                           duration: new Duration(seconds: 20),
//                           recast: new Duration(seconds: 90),
//                         )..activate(time: 25),
//                         now: i,
//                       ),
//                       new AbilityWidget(
//                         ability: new Ability(
//                           name: 'Raw Intuition',
//                           duration: new Duration(seconds: 20),
//                           recast: new Duration(seconds: 90),
//                         )..activate(time: 45),
//                         now: i,
//                       ),
//                       new AbilityWidget(
//                         ability: new Ability(
//                           name: 'Convalescence',
//                           duration: new Duration(seconds: 20),
//                           recast: new Duration(seconds: 120),
//                         )..activate(time: 45),
//                         now: i,
//                       ),
//                       new AbilityWidget(
//                         ability: new Ability(
//                           duration: new Duration(seconds: 6),
//                           recast: new Duration(seconds: 180),
//                           name: "Holmgang",
//                         )..activate(time: 10),
//                         now: i,
//                       ),
//                     ],
//                   ),
//                 )),
//           );
//         })
//         .closed
//         .whenComplete(() {
//           if (mounted) {
//             setState(() {
//               // re-enable the button
//               // _showBottomSheetCallback = _showBottomSheet;
//             });
//           }
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       key: _scaffoldKey,
//       appBar: new AppBar(
//         title: new Text('o8s'),
//         actions: <Widget>[
//           new IconButton(
//             icon: new Icon(Icons.share),
//             onPressed: () => print('pressed Share'),
//           ),
//         ],
//         bottom: new PreferredSize(
//           child: new LinearProgressIndicator(
//             value: 0.23,
//             // backgroundColor: Colors.grey,
//           ),
//           preferredSize: Size.zero,
//         ),
//       ),
//       floatingActionButton: new FloatingActionButton(
//         // onPressed: () {
//         //   if (_showBottomSheetCallback == null) {
//         //     Navigator.push(
//         //       context,
//         //       new MaterialPageRoute(
//         //         builder: (context) {
//         //           return new AlertDialog(
//         //             title: new Text('Edit Event'),
//         //             content: new Text(
//         //                 'You chose to edit the event. This feature will be supported soon.'),
//         //           );
//         //         },
//         //       ),
//         //     );
//         //   } else if (_showBottomSheetCallback != null) {
//         //     _scaffoldKey.currentState.showSnackBar(new SnackBar(
//         //       content: new Text("Please select an event to edit."),
//         //     ));
//         //   }
//         // },
//         onPressed: null,

//         child: new Icon(Icons.filter_list),
//       ),
//       body: new ListView(
//         children: events
//             .map(
//               (event) => new Container(
//                     decoration: new BoxDecoration(
//                         border: new BorderDirectional(
//                             bottom: new BorderSide(color: Colors.grey))),
//                     child: new ListTile(
//                       title: new Text(event),
//                       isThreeLine: true,
//                       subtitle: new Text('tank buster'),
//                       leading: new CircleAvatar(
//                         child: new Text('12:12',
//                             style: new TextStyle(fontSize: 15.0)),
//                         backgroundColor: Colors.black,
//                       ),
//                       trailing: new Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: <Widget>[
//                           new Row(
//                             children: <Widget>[
//                               new Icon(Icons.info),
//                               new Icon(Icons.home),
//                               new Icon(Icons.wifi),
//                               new Icon(Icons.gps_fixed),
//                               new Icon(Icons.update),
//                               new Icon(Icons.unfold_less),
//                             ],
//                           ),
//                           new Row(
//                             textDirection: TextDirection.rtl,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: <Widget>[
//                               new Icon(Icons.info),
//                               new Icon(Icons.home),
//                               new Icon(Icons.wifi),
//                             ],
//                           )
//                         ],
//                       ),
//                       onTap: () => _showBottomSheet(
//                             int.parse(
//                               event.substring(
//                                 event.indexOf(new RegExp(r'[0-9]+'), 0),
//                               ),
//                             ),
//                           ),
//                     ),
//                   ),
//             )
//             .toList(),
//       ),
//     );
//   }
// }

// // turn data into view
// class RaidEventWidget extends StatelessWidget {
//   final String event;
//   RaidEventWidget(this.event);

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return null;
//   }
// }
