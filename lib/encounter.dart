import 'response.dart';
import 'ffxiv_ability.dart';
import 'event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Encounter {
  final String title;
  final String author;
  final int enrage; // in seconds
  final List<Map<String, String>> timelineData;
  final List<Event> timeline = <Event>[];
  final List<Ability> pinned = <Ability>[];
  EncounterWidget widget;
  EncounterScreen view;

  Encounter({
    @required this.title,
    @required this.author,
    @required this.enrage,
    @required this.timelineData,
  }) {
    buildTimeline();
    buildPinned();
    _buildWidget();
    _buildScreen();
  }

  void buildTimeline() {
    // timelineData --> <Timeline>[]
    timelineData.forEach((eventData) {
      int time = int.parse(eventData['time']);
      String title = eventData['title'];
      String desc = eventData['desc'];
      Event event = new Event(
        title: title,
        time: time,
        desc: desc,
        res: new Response(time: time),
      );
      timeline.add(event);
    });
  }

  void _buildWidget() {
    String encName = this.title;
    String bgImage =
        encName.replaceAll('db', 'images').replaceAll('json', 'png');
    String avatar = bgImage.replaceAll('.png', '_avatar.png');
    this.widget = new EncounterWidget(
      enc: this,
      avatar: avatar,
      backgroundImage: bgImage,
    );
  }

  void _buildScreen() {
    new EncounterScreen(enc: this);
  }

  void buildPinned() {}
}

// ------------------------------------------

class EncounterWidget extends StatelessWidget {
  final Encounter enc;
  final String backgroundImage;
  final String avatar;

  EncounterWidget({
    @required this.enc,
    @required this.backgroundImage,
    @required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    VoidCallback goToScreen = () {
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) {
            return enc.view;
          },
        ),
      );
    };
    return new Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        image: new DecorationImage(
          fit: BoxFit.fitWidth,
          image: new AssetImage(backgroundImage),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(boxShadow: <BoxShadow>[
              new BoxShadow(
                spreadRadius: -10.0, // inset the shadow
                color: Colors.black54,
                blurRadius: 10.0,
              )
            ]),
            child: new ListTile(
              title: new Text(
                enc.title,
                style: new TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              subtitle: new Text(
                'Author: ${enc.author}',
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15.0,
                    fontStyle: FontStyle.italic),
              ),
              leading: new CircleAvatar(
                child: (avatar == null)
                    ? new Text(enc.title.substring(10, 13).toLowerCase())
                    : new Image.asset(avatar),
              ),
              onTap: goToScreen,
            ),
          ),
        ],
      ),
    );
  }

  _goToV4(BuildContext context) {
    // building data
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

    Encounter encounter = new Encounter(
      title: 'Sigmascape V4.0 (Savage)',
      author: "Velt Krapfenwald'l",
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

// ------------------------------------------

class EncounterScreen extends StatefulWidget {
  // housekeeping
  final Encounter enc;

  EncounterScreen({@required this.enc});

  @override
  _EncounterScreenState createState() => new _EncounterScreenState();
}

class _EncounterScreenState extends State<EncounterScreen> {
  double _progress;
  int _selected;

  @override
  void initState() {
    super.initState();
    _progress = 0.0;
    _selected = -1;
  }

  void _showBottomSheet(int i) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        final ThemeData themeData = Theme.of(context);
        return new Container(
          decoration: new BoxDecoration(
            border: new Border(
              top: new BorderSide(color: themeData.disabledColor),
            ),
          ),
          child: new Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new AbilityWidget(
                    ability: new Ability(
                      name: 'Rampart',
                      duration: new Duration(seconds: 20),
                      recast: new Duration(seconds: 90),
                    ),
                    now: i,
                  ),
                  new AbilityWidget(
                    ability: new Ability(
                      name: 'Raw Intuition',
                      duration: new Duration(seconds: 20),
                      recast: new Duration(seconds: 90),
                    ),
                    now: i,
                  ),
                  new AbilityWidget(
                    ability: new Ability(
                      name: 'Convalescence',
                      duration: new Duration(seconds: 20),
                      recast: new Duration(seconds: 120),
                    ),
                    now: i,
                  ),
                  new AbilityWidget(
                    ability: new Ability(
                      duration: new Duration(seconds: 6),
                      recast: new Duration(seconds: 180),
                      name: "Holmgang",
                    ),
                    now: i,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleEventOnTap(Event event) {
    setState(() {
      _progress = event.time / widget.enc.enrage;
      _selected = event.time;
    });
    _showBottomSheet(event.time);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.enc.title),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.share),
            onPressed: null,
          ),
        ],
        bottom: new PreferredSize(
          preferredSize: new Size(720.0, 3.0),
          child: new LinearProgressIndicator(
            value: _progress,
          ),
        ),
      ),
      body: new Scrollbar(
        child: new ListView(
          itemExtent: 98.0,
          padding: const EdgeInsets.only(left: 8.0, top: 16.0),
          children: widget.enc.timeline.map((event) {
            return new Card(
              child: new ListTile(
                title: new EventWidget(event: event),
                // subtitle: new Divider(color: Colors.grey, height: 2.0),
                selected: _selected == event.time,
                onTap: () => _handleEventOnTap(event),
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        child: new Icon(Icons.filter_list),
        heroTag: null,
      ),
    );
  }
}
