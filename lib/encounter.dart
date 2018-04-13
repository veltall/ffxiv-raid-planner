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
}

class EncounterScreen extends StatefulWidget {
  // housekeeping
  final GlobalKey<ScaffoldState> scaffoldKey;

  EncounterScreen({@required this.scaffoldKey, @required this.enc});

  final Encounter enc;
  @override
  _EncounterScreenState createState() => new _EncounterScreenState();
}

class _EncounterScreenState extends State<EncounterScreen> {
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
      ),
      body: new ListView(
        addAutomaticKeepAlives: true,
        padding: const EdgeInsets.only(left: 16.0),
        children: widget.enc.timeline.map((event) {
          return new EventWidget(event: event);
        }).toList(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        child: new Icon(Icons.filter_list),
      ),
    );
  }
}
