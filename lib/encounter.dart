import 'response.dart';
import 'ffxiv_ability.dart';
import 'event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Encounter {
  final String title;
  final int enrage; // in seconds
  final List<Map<String, String>> timelineData;
  final List<Event> timeline = <Event>[];
  final List<Ability> pinned = <Ability>[];

  Encounter({
    @required this.title,
    @required this.enrage,
    @required this.timelineData,
  }) {
    buildTimeline();
    buildPinned();
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

  void buildPinned() {}
}

class EncounterScreen extends StatefulWidget {
  // housekeeping
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Encounter enc;

  EncounterScreen({@required this.scaffoldKey, @required this.enc});

  @override
  _EncounterScreenState createState() => new _EncounterScreenState();
}

class _EncounterScreenState extends State<EncounterScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey;
  double _progress;

  @override
  void initState() {
    super.initState();
    _progress = 0.0;
    _scaffoldKey = widget.scaffoldKey;
  }

  void _showBottomSheet(int i) {
    _scaffoldKey.currentState.showBottomSheet<Null>((BuildContext context) {
      final ThemeData themeData = Theme.of(context);
      return new Container(
        decoration: new BoxDecoration(
            border: new Border(
                top: new BorderSide(color: themeData.disabledColor))),
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
    });
  }

  void _handleEventOnTap(Event event) {
    setState(() {
      _progress = event.time / widget.enc.enrage;
    });
    _showBottomSheet(232);
  }

  void _handleLongPress() {}

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
      body: new ListView(
        addAutomaticKeepAlives: false,
        padding: const EdgeInsets.only(left: 8.0),
        children: widget.enc.timeline.map((event) {
          return ListTile(
            title: new EventWidget(event: event),
            subtitle: new Divider(color: Colors.grey, height: 2.0),
            selected: (event.time == 0),
            onLongPress: _handleLongPress,
            onTap: () => _handleEventOnTap(event),
          );
        }).toList(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        child: new Icon(Icons.filter_list),
      ),
    );
  }
}
